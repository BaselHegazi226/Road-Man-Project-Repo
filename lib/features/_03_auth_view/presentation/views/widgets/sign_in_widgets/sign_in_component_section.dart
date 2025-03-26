import 'package:flutter/material.dart';

import '../common_widgets/auth_component_section.dart';
import '../common_widgets/auth_sub_title.dart';
import '../common_widgets/social_auth_card_section.dart';
import 'sign_in_input_data_section.dart';

class SignInComponentSection extends StatelessWidget {
  const SignInComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AuthComponentSection(
      title: 'Login to your account',
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
        ), // بدل 16px
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.03, // بدل 24px
                bottom: screenHeight * 0.015, // بدل 12px
              ),
              child: SocialAuthCardSection(
                onPressed1: () {},
                onPressed2: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.03), // بدل 24px
              child: const AuthSubTitle(subTitle: 'Or use your email account'),
            ),
            SignInInputDataSection(),
          ],
        ),
      ),
    );
  }
}
