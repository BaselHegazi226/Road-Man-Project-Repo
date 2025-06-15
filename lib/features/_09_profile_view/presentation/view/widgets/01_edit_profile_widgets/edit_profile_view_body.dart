import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';
import 'package:road_man_project/generated/assets.dart';

import '../../../../../../core/manager/user_info_manager.dart';
import '../../../view_model/get_user_info_cubit/get_user_info_cubit.dart';
import 'change_password_button.dart';
import 'edit_profile_image.dart';
import 'edit_profile_names_fields_section.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final TextEditingController nameEditingController = TextEditingController();
  bool buttonIsLoading = false;
  UserInfoModel? userInfoModel;
  String? newPickedImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userInfo = await UserInfoStorageHelper.getUserInfo();
    if (!mounted) return;
    if (userInfo != null) {
      setState(() {
        userInfoModel = userInfo;
        nameEditingController.text = userInfo.name ?? '';
      });
    }
  }

  Future<String> _convertImageToBase64(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    return base64Encode(bytes);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .04,
        vertical: screenHeight * .04,
      ),
      child: Column(
        spacing: screenHeight * .03,
        children: [
          /// صورة الملف الشخصي وتحديثها مؤقتًا فقط
          EditProfileImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image:
                newPickedImagePath ??
                userInfoModel?.photo ??
                Assets.profileProfileUserImage,
            onImagePicked: (String imagePath) {
              setState(() {
                newPickedImagePath = imagePath;
              });
            },
          ),
          if (userInfoModel != null)
            EditProfileNamesFieldsSection(
              nameEditingController: nameEditingController,
              email: userInfoModel!.email ?? '',
            ),
          ChangePasswordButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.changePasswordViewId);
            },
          ),
          BlocConsumer<ProfileBloc, ProfileStates>(
            listener: (context, state) async {
              if (state is UpdateProfileFailureState) {
                if (!context.mounted) return;
                showSafeSnackBar(
                  context,
                  state.errorMessage,
                  kAppPrimaryWrongColor,
                );
              } else if (state is UpdateProfileSuccessState) {
                final updatedUser = userInfoModel!.copyWith(
                  name: nameEditingController.text.trim(),
                  photo: newPickedImagePath ?? userInfoModel!.photo,
                );
                await UserInfoStorageHelper.saveUserInfo(updatedUser);

                if (context.mounted) {
                  context.read<GetUserInfoCubit>().localGetUserInfo();
                  showSafeSnackBar(
                    context,
                    'Update Profile Success',
                    kAppPrimaryBlueColor,
                  );
                }

                setState(() {
                  userInfoModel = updatedUser;
                  newPickedImagePath = null;
                });
              }
              setState(() {
                buttonIsLoading = state is UpdateProfileLoadingState;
              });
            },
            builder: (context, state) {
              return CustomTextButton(
                onPressed: () async {
                  if (userInfoModel == null) return;

                  String photoData = userInfoModel!.photo ?? '';
                  if (newPickedImagePath != null &&
                      newPickedImagePath!.startsWith('/data/')) {
                    photoData = await _convertImageToBase64(
                      newPickedImagePath!,
                    );
                  }
                  print('photo data : $photoData');
                  print('new picked image path : $newPickedImagePath');

                  context.read<ProfileBloc>().add(
                    UpdateProfileEvent(
                      photo: photoData,
                      name: nameEditingController.text.trim(),
                      dateOfBirth: userInfoModel!.dateOfBirth ?? '',
                    ),
                  );
                },
                backgroundColor: kAppPrimaryBlueColor,
                child:
                    buttonIsLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const CustomTitle(title: 'Update Profile'),
              );
            },
          ),
          CustomTextButton(
            onPressed: () {},
            backgroundColor: kAppPrimaryWhiteColor,
            borderColor: kAppPrimaryBlackColor,
            child: Center(
              child: Row(
                spacing: screenWidth * .02,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lightbulb_circle_rounded,
                    size: screenWidth * .06,
                    color: kAppPrimaryBlackColor,
                  ),
                  Text(
                    'Create New Recommendation',
                    style: AfacadTextStyles.textStyle18W600Black(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
