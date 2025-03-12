import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_password_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_text_form_fields_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import 'other_register_section.dart';

class SignInInputDataSection extends StatefulWidget {
  const SignInInputDataSection({super.key});

  @override
  State<SignInInputDataSection> createState() => _SignInInputDataSectionState();
}

class _SignInInputDataSectionState extends State<SignInInputDataSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SignInTextFormFieldsSection(formKey: _formKey),
        RememberMeForgetPasswordSection(
          forgetPasswordPressed: () {
            GoRouter.of(context).push(Routes.forgetPasswordView);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            spacing: 24,
            children: [
              CustomTextButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // ✅ هنا يمكنك إرسال البيانات إلى السيرفر بعد التحقق منها
                  }
                },
                backgroundColor: kAppPrimaryBlueColor,
                child: CustomTitle(
                  title: 'Sign in',
                  textColor: kSecondlyLightWhiteColor,
                ),
              ),
              CustomTextButton(
                onPressed: () {
                  GoRouter.of(context).push(Routes.homeView);
                },
                backgroundColor: kSecondlyLightWhiteColor,
                borderColor: kAppPrimaryBlueColor,
                child: CustomTitle(
                  title: 'Continue as a Guest',
                  textColor: kAppPrimaryBlueColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4),
          child: OtherRegisterSection(
            blackText: 'Don’t have an account? ',
            blueText: 'Sign up',
            onTap: () {
              GoRouter.of(context).push(Routes.signUpView);
            },
          ),
        ),
      ],
    );
  }
}
