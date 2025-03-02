import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/auth_component_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_input_data_section.dart';

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
            SignUpInputDataSection(),
          ],
        ),
      ),
    );
  }
}
