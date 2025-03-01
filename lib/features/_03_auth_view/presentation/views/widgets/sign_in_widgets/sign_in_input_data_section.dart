import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/sign_up_view.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_password_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_text_form_fields_section.dart';

import 'other_register_section.dart';
import 'sign_in_button_section.dart';

class SignInInputDataSection extends StatelessWidget {
  const SignInInputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          TextFormFieldsSection(),
          RememberMeForgetPasswordSection(forgetPasswordPressed: () {}),
          ButtonSection(),
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: OtherRegisterSection(
              blackText: 'Don’t have an account? ',
              blueText: 'Sign up',
              onTap: () {
                GoRouter.of(context).push(SignUpView.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
