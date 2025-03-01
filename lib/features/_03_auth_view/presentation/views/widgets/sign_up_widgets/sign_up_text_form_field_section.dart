import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        CustomTextFormField(
          hintText: 'Password',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.lock_outline,
          suffixIcon: FontAwesomeIcons.eyeSlash,
        ),
        CustomTextFormField(
          hintText: 'Confirm password',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.lock_outline,
          suffixIcon: FontAwesomeIcons.eyeSlash,
        ),
      ],
    );
  }
}
