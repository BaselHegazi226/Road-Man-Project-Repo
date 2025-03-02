import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_text_form_field_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../sign_in_widgets/other_register_section.dart';

class SignUpInputDataSection extends StatelessWidget {
  const SignUpInputDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: SignUPTextFormFieldSection(),
        ),
        CustomTextButton(
          onPressed: () {},
          backgroundColor: kAppPrimaryBlueColor,
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
    );
  }
}
