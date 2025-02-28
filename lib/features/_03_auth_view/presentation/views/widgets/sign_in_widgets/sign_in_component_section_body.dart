import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../common_widgets/auth_sub_title.dart';
import '../common_widgets/auth_title.dart';
import '../common_widgets/social_auth_card_section.dart';
import 'input_data_section.dart';

class SignInComponentSectionBody extends StatelessWidget {
  const SignInComponentSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: AuthTitle(title: 'Login to your account'),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: kSecondlyLightWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: const SocialAuthCardSection(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: const AuthSubTitle(
                    subTitle: 'Or use your email account',
                  ),
                ),
                InputDataSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
