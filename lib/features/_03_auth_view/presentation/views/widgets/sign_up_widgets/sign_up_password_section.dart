import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/password_text_form_field.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_up_widgets/check_password_section.dart';

class SignUpPasswordSection extends StatefulWidget {
  const SignUpPasswordSection({
    super.key,
    required this.passwordEditingController,
    required this.passwordFocusNode,
  });

  final TextEditingController passwordEditingController;
  final FocusNode passwordFocusNode;

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

  String? password, passwordErrorMessage;
  late TextEditingController passwordEditingController;

  @override
  void initState() {
    super.initState();
    passwordControllerValue();
    focusFun();
  }

  void passwordControllerValue() {
    passwordEditingController = widget.passwordEditingController;
  }

  @override
  void dispose() {
    disposeFun();
    super.dispose();
  }

  void clearFun() {
    widget.passwordEditingController.clear();
  }

  void focusFun() {
    widget.passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  void disposeFun() {
    widget.passwordFocusNode.dispose();
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
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: screenHeight * 0.02,
      children: [
        PasswordTextFormField(
          hintText: 'Password',
          focusNode: widget.passwordFocusNode,
          textEditingController: widget.passwordEditingController,
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
              //              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).{8,}$',//ده الصح اللي هيكون موجود عندي في التطبيق بعد لما حازم يعدلها عنده
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%?&]{8,}$', // دي المتوافقه مع نسخه حازم اللي هتتعدل بعد كده
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
      ],
    );
  }
}
