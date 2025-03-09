import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../sign_up_widgets/check_password_section.dart';

class ResetPasswordInputDataSection extends StatefulWidget {
  const ResetPasswordInputDataSection({super.key});

  @override
  State<ResetPasswordInputDataSection> createState() =>
      _ResetPasswordInputDataSectionState();
}

class _ResetPasswordInputDataSectionState
    extends State<ResetPasswordInputDataSection> {
  String? password, confirmPassword;

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsSpecialChar = false;
  bool containsNumbers = false;
  bool containsPassLength = false;

  String? passwordErrorMessage, confirmPasswordErrorMessage;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    focusFun();
  }

  @override
  void dispose() {
    disposeFun();
    super.dispose();
  }

  void clearFun() {
    passwordEditingController.clear();
    confirmPasswordEditingController.clear();
  }

  void focusFun() {
    passwordFocusNode.addListener(() {
      setState(() {});
    });
    confirmPasswordEditingController.addListener(() {
      setState(() {});
    });
  }

  void disposeFun() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  void regExpForCheckPasswordVarsFun(String value) {
    containsLowerCase = RegExp(r'(?=.*[a-z])').hasMatch(value);
    containsUpperCase = RegExp(r'(?=.*[A-Z])').hasMatch(value);
    containsNumbers = RegExp(r'(?=.*\d)').hasMatch(value);
    containsSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(value);
    containsPassLength = RegExp(r'.{8,}').hasMatch(value);
  }

  void onResetFun() {
    clearFun();
    defaultPasswordChecksFun();
  }

  void defaultPasswordChecksFun() {
    setState(() {
      containsNumbers = false;
      containsSpecialChar = false;
      containsPassLength = false;
      containsUpperCase = false;
      containsLowerCase = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        CustomTextFormField(
          hintText: 'New Password',
          focusNode: passwordFocusNode,
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
              return 'Please enter a password';
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
          onSaved: (value) {
            password = value;
          },
        ),
        CheckPasswordSection(
          containsPassLength: containsPassLength,
          containsSpecialChar: containsSpecialChar,
          containsNumber: containsNumbers,
          containsUpperCase: containsUpperCase,
          containsLowerCase: containsLowerCase,
        ),
        CustomTextFormField(
          hintText: 'Confirm Password',
          focusNode: confirmPasswordFocusNode,
          textEditingController: confirmPasswordEditingController,
          prefixIcon: Icons.lock_outline,
          obscureText: obscureConfirmPassword,
          suffixIcon:
              obscureConfirmPassword
                  ? CupertinoIcons.eye_slash
                  : CupertinoIcons.eye,
          suffixIconOnPressed: () {
            setState(() {
              obscureConfirmPassword = !obscureConfirmPassword;
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            } else if (value != password) {
              return 'password not match';
            }
            return null;
          },
          onSaved: (value) {
            password = value;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: CustomTextButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {}
            },
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(title: 'Update Password'),
          ),
        ),
      ],
    );
  }
}
