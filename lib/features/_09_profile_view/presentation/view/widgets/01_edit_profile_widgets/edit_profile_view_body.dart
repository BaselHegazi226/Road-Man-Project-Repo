import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/tokens_manager/user_info_manager.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';
import 'package:road_man_project/generated/assets.dart';

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

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userInfo = await UserInfoStorageHelper.getUserInfo();

    if (userInfo != null) {
      setState(() {
        userInfoModel = userInfo;
        nameEditingController.text = userInfo.name ?? '';
      });
    }
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
          /// ✅ صورة الملف الشخصي وتحديثها مباشرة على السيرفر + محلياً
          EditProfileImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image: userInfoModel?.photo ?? Assets.profileProfileUserImage,
            onImagePicked: (String imagePath) {
              if (userInfoModel == null) return;

              // تحديث على السيرفر
              context.read<ProfileBloc>().add(
                UpdateProfileEvent(
                  photo: imagePath,
                  name: userInfoModel!.name ?? '',
                  dateOfBirth: userInfoModel!.dateOfBirth ?? '',
                ),
              );

              // تحديث محلي
              final updatedUser = userInfoModel!.copyWith(photo: imagePath);
              UserInfoStorageHelper.saveUserInfo(updatedUser);
              setState(() {
                userInfoModel = updatedUser;
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

          /// ✅ زر حفظ التحديثات النصية
          BlocConsumer<ProfileBloc, ProfileStates>(
            listener: (context, state) async {
              if (state is UpdateProfileFailureState) {
                showSafeSnackBar(
                  context,
                  state.errorMessage,
                  kAppPrimaryWrongColor,
                );
              } else if (state is UpdateProfileSuccessState) {
                final updatedUser = userInfoModel!.copyWith(
                  name: nameEditingController.text.trim(),
                );
                await UserInfoStorageHelper.saveUserInfo(updatedUser);
                showSafeSnackBar(
                  context,
                  'Update Profile Success',
                  kAppPrimaryBlueColor,
                );

                setState(() {
                  userInfoModel = updatedUser;
                });
              }

              setState(() {
                buttonIsLoading = state is UpdateProfileLoadingState;
              });
            },
            builder: (context, state) {
              return CustomTextButton(
                onPressed: () {
                  if (userInfoModel == null) return;

                  BlocProvider.of<ProfileBloc>(context).add(
                    UpdateProfileEvent(
                      photo: userInfoModel!.photo ?? '',
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
        ],
      ),
    );
  }
}
