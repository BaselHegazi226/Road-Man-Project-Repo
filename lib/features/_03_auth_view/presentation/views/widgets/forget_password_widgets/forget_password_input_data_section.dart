import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_text_form_field.dart';
import '../../../../../../core/utilities/custom_title.dart';

class ForgetPasswordInputDataSection extends StatefulWidget {
  const ForgetPasswordInputDataSection({super.key});

  @override
  State<ForgetPasswordInputDataSection> createState() =>
      _ForgetPasswordInputDataSectionState();
}

class _ForgetPasswordInputDataSectionState
    extends State<ForgetPasswordInputDataSection> {
  TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? emailErrorMessage;

  final FocusNode emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusListenerFun();
    controllerListenerFun();
  }

  void focusListenerFun() {
    //to make the email field is focus when i press on it
    emailFocusNode.addListener(() {
      setState(() {});
    });
  }

  void controllerListenerFun() {
    //to listen to the action which happens in the email controller field
    emailEditingController.addListener(emailControllerFun);
  }

  @override
  void dispose() {
    focusDisposeFun();
    removeControlFun();
    super.dispose();
  }

  void focusDisposeFun() {
    //to terminate the focus of email field as soon as moving to any field
    emailFocusNode.dispose();
  }

  void removeControlFun() {
    emailEditingController.removeListener(emailControllerFun);
  }

  void emailControllerFun() {
    setState(() {
      emailErrorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Form(
      key: _formKey,
      child: Column(
        spacing: screenHeight * .03,
        children: [
          CustomTextFormField(
            backgroundColor: kFilledTextFormFieldColor,
            hintText: 'Email',
            textEditingController: emailEditingController,
            keyboardType: TextInputType.text,
            textColor: kTextBlackPrimaryColor,
            prefixIcon: Icons.email_outlined,
            validator: (email) {
              String? trimmedValue = email?.trim();
              if (trimmedValue == null || trimmedValue.isEmpty) {
                return 'Please enter an email';
              } else if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(trimmedValue)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (newValue) {
              email = newValue;
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .005),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  customAwesomeDialog(
                    context: context,
                    title: 'Password Reset Email Sent',
                    description:
                        'We \'ve sent a password reset link to your email. Please check your inbox and follow the instructions to reset your password.',
                    isSuccess: true,
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).push(Routes.verificationOtpViewId, extra: state.email);
                    },
                  );
                } else if (state is ForgetPasswordFailure) {
                  customAwesomeDialog(
                    context: context,
                    title: state.errorMessage,
                    description: 'try again later!',
                    isSuccess: false,
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  );
                }
              },
              builder: (context, state) {
                return CustomTextButton(
                  onPressed:
                      state is ForgetPasswordLoading
                          ? null
                          : () {
                            if (!_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                              context.read<AuthBloc>().add(
                                ForgetPasswordEvent(
                                  email: emailEditingController.text.trim(),
                                ),
                              );
                            }
                          },
                  backgroundColor: kAppPrimaryBlueColor,
                  child:
                      state is ForgetPasswordLoading
                          ? const CustomCircleIndicator()
                          : CustomTitle(title: 'Reset Password'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
