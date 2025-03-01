import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/auth_component_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/other_register_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';

import '../common_widgets/auth_sub_title.dart';
import '../common_widgets/social_auth_card_section.dart';

class SignUpComponentSection extends StatelessWidget {
  const SignUpComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthComponentSection(
      title: 'Create New Account',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: SocialAuthCardSection(
                onPressed1: () {},
                onPressed2: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: const AuthSubTitle(subTitle: 'Or use your email account'),
            ),
            SignUPTextFormFieldSection(),
            SizedBox(height: 24),
            CustomTextButton(
              onPressed: () {},
              backgroundColor: kAppPrimaryColor,
              child: CustomTitle(title: 'Sign up'),
            ),
            SizedBox(height: 20),
            OtherRegisterSection(
              onTap: () {
                GoRouter.of(context).pop();
              },
              blackText: 'Already have an account? ',
              blueText: 'Login here',
            ),
          ],
        ),
      ),
    );
  }
}
