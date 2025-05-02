import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/password_text_form_field.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../sign_up_widgets/check_password_section.dart';

class ResetPasswordInputDataSection extends StatefulWidget {
  const ResetPasswordInputDataSection({super.key, required this.emailAndOtp});
  final Map<String, dynamic> emailAndOtp;

  @override
  State<ResetPasswordInputDataSection> createState() =>
      _ResetPasswordInputDataSectionState();
}

class _ResetPasswordInputDataSectionState
    extends State<ResetPasswordInputDataSection> {
  String? password, confirmPassword;

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController newPasswordEditingController = TextEditingController();
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
    newPasswordEditingController.clear();
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
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: screenHeight * .02,
      children: [
        PasswordTextFormField(
          hintText: 'New Password',
          focusNode: passwordFocusNode,
          textEditingController: newPasswordEditingController,
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
        PasswordTextFormField(
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
          padding: EdgeInsets.only(top: screenHeight * .02),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                customAwesomeDialog(
                  context: context,
                  isSuccess: true,
                  title: 'Password Updated Successfully',
                  description:
                      'Your password has been changed. Please log in with your new password',
                  buttonText: 'Continue to Sign in',
                  onPressed: () {
                    GoRouter.of(context).push(Routes.signInViewId);
                  },
                );
              } else if (state is ResetPasswordFailure) {
                customAwesomeDialog(
                  context: context,
                  isSuccess: false,
                  title: 'Password Update Failed',
                  description: state.errorMessage,
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                );
              }
            },
            builder: (context, state) {
              return CustomTextButton(
                onPressed:
                    state is ResetPasswordLoading
                        ? null
                        : () {
                          if (!_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<AuthBloc>().add(
                              ResetPasswordEvent(
                                email: widget.emailAndOtp['email'],
                                otp: widget.emailAndOtp['otp'],
                                newPassword:
                                    newPasswordEditingController.text.trim(),
                                confirmPassword:
                                    confirmPasswordEditingController.text
                                        .trim(),
                              ),
                            );
                          }
                        },
                backgroundColor: kAppPrimaryBlueColor,
                child:
                    state is ResetPasswordLoading
                        ? const CustomCircleIndicator()
                        : const CustomTitle(title: 'Update Password'),
              );
            },
          ),
        ),
      ],
    );
  }
}
