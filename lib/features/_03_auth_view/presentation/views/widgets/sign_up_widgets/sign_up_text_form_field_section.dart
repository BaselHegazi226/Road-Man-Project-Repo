import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUPTextFormFieldSection extends StatefulWidget {
  const SignUPTextFormFieldSection({super.key});

  @override
  State<SignUPTextFormFieldSection> createState() =>
      _SignUPTextFormFieldSectionState();
}

class _SignUPTextFormFieldSectionState
    extends State<SignUPTextFormFieldSection> {
  bool obscurePassword = true;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsPassLength = false;
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

  void regExpForCheckPasswordVarsFun(String value) {
    containsLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
    containsUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
    containsNumbers = RegExp(r'(?=.*\d)').hasMatch(value);
    containsSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value);
    containsPassLength = RegExp(r'.{8,}').hasMatch(value);
  }
}
