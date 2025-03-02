import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/sign_up_view.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/forget_password_view.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_button_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_password_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_text_form_fields_section.dart';

import 'other_register_section.dart';

class SignInInputDataSection extends StatelessWidget {
  const SignInInputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TextFormFieldsSection(),
        RememberMeForgetPasswordSection(
          forgetPasswordPressed: () {
            GoRouter.of(context).push(ForgetPasswordView.id);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: SignInButtonSection(),
        ),
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
    );
  }
}
