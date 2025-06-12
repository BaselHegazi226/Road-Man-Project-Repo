import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/tokens_manager/tokens_manager.dart';
import 'package:road_man_project/core/tokens_manager/user_info_manager.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

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
  String? userToken;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userInfo = await UserInfoStorageHelper.getUserInfo();
    final userTokens = await SecureStorageHelper.getUserTokens();
    if (userInfo != null) {
      setState(() {
        userInfoModel = userInfo;
        nameEditingController.text = userInfo.name ?? '';
      });
    }
    if (userTokens != null) {
      userToken = userTokens.token;
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
          EditProfileImage(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
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
                await _handleUpdateProfileFailureState(context, state);
              } else if (state is UpdateProfileSuccessState) {
                await _handleUpdateProfileSuccessState(context);
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

  Future<UserInfoModel> _handleUpdateProfileSuccessState(
    BuildContext context,
  ) async {
    showSnackBar(context, 'Update Profile Success', kAppPrimaryBlueColor);

    final updatedUser = userInfoModel!.copyWith(
      name: nameEditingController.text.trim(),
    );

    await UserInfoStorageHelper.saveUserInfo(updatedUser);

    setState(() {
      userInfoModel = updatedUser;
    });
    return userInfoModel!;
  }

  Future<void> _handleUpdateProfileFailureState(
    BuildContext context,
    UpdateProfileFailureState state,
  ) async {
    showSnackBar(context, state.errorMessage, kAppPrimaryWrongColor);

    if (userInfoModel != null) {
      await UserInfoStorageHelper.saveUserInfo(userInfoModel!);
    }
  }
}
