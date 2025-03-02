import 'package:flutter/material.dart';

import '../common_widgets/auth_component_section.dart';
import '../common_widgets/auth_sub_title.dart';
import '../common_widgets/social_auth_card_section.dart';
import 'sign_in_input_data_section.dart';

class SignInComponentSection extends StatelessWidget {
  const SignInComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthComponentSection(
      title: 'Login to your account',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12),
              child: SocialAuthCardSection(
                onPressed1: () {},
                onPressed2: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: const AuthSubTitle(subTitle: 'Or use your email account'),
            ),
            SignInInputDataSection(),
          ],
        ),
      ),
    );
  }
}
