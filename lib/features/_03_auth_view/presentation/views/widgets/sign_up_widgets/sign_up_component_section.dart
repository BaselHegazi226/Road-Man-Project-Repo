import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/auth_component_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/other_register_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';

class SignUpComponentSection extends StatelessWidget {
  const SignUpComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthComponentSection(
      title: 'Create New Account',
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: SignUPTextFormFieldSection(),
            ),
            CustomTextButton(
              onPressed: () {},
              backgroundColor: kAppPrimaryColor,
              child: CustomTitle(title: 'Sign up'),
            ),
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
