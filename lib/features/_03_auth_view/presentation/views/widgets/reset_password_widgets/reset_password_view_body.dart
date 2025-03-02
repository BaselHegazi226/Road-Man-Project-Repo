import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/Assets.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_pass_fields_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../common_widgets/custom_image.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 32,
        children: [
          CustomImage(imageBottomPadding: 21, image: kResetPasswordImage),
          Text(
            maxLines: 2,
            'Create a new password for your account.                                                    Make sure to choose a strong and secure password',
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: -.228,
              height: 1.5,
            ),
          ),
          ResetPassFieldsSection(),
          CustomTextButton(
            onPressed: () {},
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(title: 'Update Password'),
          ),
        ],
      ),
    );
  }
}
