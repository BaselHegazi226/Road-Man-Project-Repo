import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/Assets.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../common_widgets/custom_image.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 24,
        children: [
          CustomImage(image: kResetPasswordImage),
          Text(
            maxLines: 3,
            'Create a new password for your account. Make sure to choose a strong and secure password',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
              height: 1.5,
            ),
          ),
          CustomTextFormField(
            hintText: 'New Password',
            prefixIcon: Icons.lock_outline,
            suffixIcon: CupertinoIcons.eye_slash,
            textEditingController: TextEditingController(),
          ),
          CustomTextFormField(
            hintText: 'Confirm Password',
            prefixIcon: Icons.lock_outline,
            suffixIcon: CupertinoIcons.eye_slash,
            textEditingController: TextEditingController(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomTextButton(
              onPressed: () {},
              backgroundColor: kAppPrimaryBlueColor,
              child: CustomTitle(title: 'Update Password'),
            ),
          ),
        ],
      ),
    );
  }
}
