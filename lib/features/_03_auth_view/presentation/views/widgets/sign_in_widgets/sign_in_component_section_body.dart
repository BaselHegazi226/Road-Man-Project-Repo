import 'package:flutter/material.dart';

import '../common_widgets/auth_component_section.dart';
import '../common_widgets/auth_sub_title.dart';
import '../common_widgets/social_auth_card_section.dart';
import 'input_data_section.dart';

class SignInComponentSectionBody extends StatelessWidget {
  const SignInComponentSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthComponentSection(
      title: 'Login to your account',
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
            child: const SocialAuthCardSection(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const AuthSubTitle(subTitle: 'Or use your email account'),
          ),
          InputDataSection(),
        ],
      ),
    );
  }
}
