import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/sign_up_password_section.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUPTextFormFieldSection extends StatelessWidget {
  const SignUPTextFormFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          hintText: 'Name',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.person_2_outlined,
        ),
        CustomTextFormField(
          hintText: 'Email',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.email_outlined,
        ),
        SignUpPasswordSection(),
      ],
    );
  }
}
