import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/custom_text_form_field.dart';

class SignUpPasswordSection extends StatefulWidget {
  const SignUpPasswordSection({super.key});

  @override
  State<SignUpPasswordSection> createState() => _SignUpPasswordSectionState();
}

class _SignUpPasswordSectionState extends State<SignUpPasswordSection> {
  bool obscurePassword = true;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsPassLength = false;

  void regExpForCheckPasswordVarsFun(String value) {
    containsLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
    containsUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
    containsNumbers = RegExp(r'(?=.*\d)').hasMatch(value);
    containsSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value);
    containsPassLength = RegExp(r'.{8,}').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomTextFormField(
          hintText: 'Password',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.lock_outline,
          suffixIcon: CupertinoIcons.eye_slash,
        ),

        CustomTextFormField(
          hintText: 'Confirm password',
          textEditingController: TextEditingController(),
          prefixIcon: Icons.lock_outline,
          suffixIcon: CupertinoIcons.eye_slash,
        ),
      ],
    );
  }
}
