import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/Assets.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_text_form_field.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_image.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 24,
        children: [
          CustomImage(image: kForgetPasswordImage),
          Text(
            maxLines: 3,
            'Don’t worry! We’ll help you regain access to your account. Enter your registered email or phone number to reset your password',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
              height: 1.5,
            ),
          ),
          CustomTextFormField(
            hintText: 'Email',
            prefixIcon: Icons.email_outlined,
            textEditingController: TextEditingController(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomTextButton(
              onPressed: () {},
              backgroundColor: kAppPrimaryBlueColor,
              child: CustomTitle(title: 'Reset Password'),
            ),
          ),
        ],
      ),
    );
  }
}
