import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/check_password_section.dart';

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
  TextEditingController passwordEditingController = TextEditingController();

  void regExpForCheckPasswordVarsFun(String value) {
    setState(() {
      containsLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
      containsUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
      containsNumbers = RegExp(r'(?=.*\d)').hasMatch(value);
      containsSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value);
      containsPassLength = RegExp(r'.{8,}').hasMatch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          hintText: 'Password',
          textEditingController: passwordEditingController,
          prefixIcon: Icons.lock_outline,
          obscureText: obscurePassword,
          suffixIcon:
              obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          suffixIconOnPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Password is required';
            } else if (!RegExp(
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,}\$',
            ).hasMatch(value)) {
              return 'Please enter a valid password! (Aa#12345)';
            }
            return null;
          },
          onChanged: (password) {
            regExpForCheckPasswordVarsFun(password);
          },
        ),
        CheckPasswordSection(
          containsPassLength: containsPassLength,
          containsSpecialChar: containsSpecialChar,
          containsNumber: containsNumbers,
          containsUpperCase: containsUpperCase,
          containsLowerCase: containsLowerCase,
        ),
      ],
    );
  }
}
