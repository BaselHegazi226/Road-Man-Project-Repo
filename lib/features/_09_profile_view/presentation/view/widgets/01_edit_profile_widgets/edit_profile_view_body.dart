import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import 'change_password_button.dart';
import 'edit_profile_image.dart';
import 'edit_profile_names_fields_section.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  TextEditingController nameEditingController = TextEditingController();
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
          EditProfileNamesFieldsSection(
            nameEditingController: nameEditingController,
          ),
          ChangePasswordButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.changePasswordViewId);
            },
          ),
          CustomTextButton(
            onPressed: () {},
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(title: 'Update Profile'),
          ),
        ],
      ),
    );
  }
}
