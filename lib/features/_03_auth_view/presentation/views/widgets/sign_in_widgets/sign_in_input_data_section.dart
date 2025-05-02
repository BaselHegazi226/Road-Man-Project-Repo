import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_remember_password_section.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/sign_in_widgets/sign_in_text_form_fields_section.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';
import '../../../../../../core/utilities/dialogState.dart';
import 'other_register_section.dart';

class SignInInputDataSection extends StatefulWidget {
  const SignInInputDataSection({super.key});

  @override
  State<SignInInputDataSection> createState() => _SignInInputDataSectionState();
}

class _SignInInputDataSectionState extends State<SignInInputDataSection> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      spacing: screenHeight * 0.02,
      children: [
        SignInTextFormFieldsSection(
          formKey: _formKey,
          emailEditingController: emailController,
          passwordEditingController: passwordController,
        ),
        RememberMeForgetPasswordSection(
          forgetPasswordPressed: () {
            GoRouter.of(context).push(Routes.forgetPasswordViewId);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.02),
          child: Column(
            spacing: screenHeight * 0.02,
            children: [
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    customAwesomeDialog(
                      context: context,
                      isSuccess: true,
                      title: 'Sign in Success',
                      description:
                          'You have successfully sign into Road Man. Enjoy exploring all the features available to you',
                      onPressed: () {
                        GoRouter.of(context).push(Routes.mainViewId);
                      },
                    );
                  } else if (state is SignInSuccess) {
                    customAwesomeDialog(
                      context: context,
                      isSuccess: false,
                      title: 'Sign In Failure',
                      description:
                          'There was an issue with your registration. Please check your details and try again. If the problem persists, contact support',
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    );
                  } else {
                    print('loading sign in');
                  }
                },
                builder: (context, state) {
                  return CustomTextButton(
                    onPressed:
                        state is SignInLoading
                            ? null
                            : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState?.save();
                                context.read<AuthBloc>().add(
                                  SignInEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                    backgroundColor: kAppPrimaryBlueColor,
                    child:
                        state is SignInLoading
                            ? CustomCircleIndicator()
                            : CustomTitle(
                              title: 'Sign in',
                              textColor: kSecondlyLightWhiteColor,
                            ),
                  );
                },
              ),
              CustomTextButton(
                onPressed: () {
                  GoRouter.of(context).push(Routes.mainViewId);
                },
                backgroundColor: kSecondlyLightWhiteColor,
                borderColor: kAppPrimaryBlueColor,
                child: CustomTitle(
                  title: 'Continue as a Guest',
                  textColor: kAppPrimaryBlueColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.005),
          child: OtherRegisterSection(
            blackText: 'Don’t have an account? ',
            blueText: 'Sign up',
            onTap: () {
              GoRouter.of(context).push(Routes.signUpViewId);
            },
          ),
        ),
      ],
    );
  }
}
