import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
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
  String? newPickedImageBase64;

  @override
  void initState() {
    super.initState();
    _deleteEmptyImages();
    _loadUserData();
  }

  Future<void> _deleteEmptyImages() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync();

    for (var file in files) {
      if (file is File && file.path.endsWith('.jpg')) {
        final length = await file.length();
        if (length == 0) {
          await file.delete();
          debugPrint("🧹 Deleted empty image: ${file.path}");
        }
      }
    }
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
    try {
      final bytes = await File(imagePath).readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      debugPrint('❌ Error reading image file: $imagePath');
      rethrow;
    }
  }

  ImageProvider getProfileImageProvider() {
    if (newPickedImageBase64 != null && newPickedImageBase64!.isNotEmpty) {
      try {
        return MemoryImage(base64Decode(newPickedImageBase64!));
      } catch (e) {
        debugPrint('❌ Error decoding new picked base64 image');
      }
    }

    if (userInfoModel?.photo != null && userInfoModel!.photo!.isNotEmpty) {
      try {
        final decoded = base64Decode(userInfoModel!.photo!);
        return MemoryImage(decoded);
      } catch (e) {
        debugPrint('❌ Error decoding saved base64 image');
      }
    }

    return const AssetImage(Assets.profileProfileUserImage);
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
          EditProfileImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image: getProfileImageProvider(),
            onImagePicked: (String imagePath) async {
              try {
                final base64Image = await _convertImageToBase64(imagePath);
                setState(() {
                  newPickedImageBase64 = base64Image;
                });
              } catch (e) {
                if (!mounted) return;
                showSafeSnackBar(context, e.toString(), kAppPrimaryWrongColor);
              }
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
                  photo: newPickedImageBase64 ?? userInfoModel!.photo,
                );
                await UserInfoStorageHelper.saveUserInfo(updatedUser);

                if (!mounted) return;

                context.read<GetUserInfoCubit>().localGetUserInfo();
                showSafeSnackBar(
                  context,
                  'Update Profile Success',
                  kAppPrimaryBlueColor,
                );

                setState(() {
                  userInfoModel = updatedUser;
                  newPickedImageBase64 = null;
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
                  if (newPickedImageBase64 != null) {
                    photoData = newPickedImageBase64!;
                  }

                  if (!mounted) return;
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
