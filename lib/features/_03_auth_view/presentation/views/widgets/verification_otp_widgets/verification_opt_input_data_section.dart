import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/dialogState.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_otp_widgets/verification_otp_fields.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class VerificationOtpInputDataSection extends StatefulWidget {
  const VerificationOtpInputDataSection({super.key, required this.email});
  final String email;

  @override
  State<VerificationOtpInputDataSection> createState() =>
      _VerificationOtpInputDataSectionState();
}

class _VerificationOtpInputDataSectionState
    extends State<VerificationOtpInputDataSection> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final List<TextEditingController> otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      spacing: screenHeight * .03,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight * .015),
          child: VerificationOtpFields(
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
            otpControllers: otpControllers,
            otpFocusNodes: otpFocusNodes,
          ),
        ),
        BlocConsumer<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              showSnackBar(
                context,
                'Please check your inbox',
                kAppPrimaryBlueColor.withAlpha(125),
              );
            } else if (state is ForgetPasswordFailure) {
              showSnackBar(
                context,
                state.errorMessage,
                kAppPrimaryWrongColor.withAlpha(125),
              );
            }
          },
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                  ForgetPasswordEvent(email: widget.email),
                );
              },
              child: Text(
                'Send again ?',
                style: AfacadTextStyles.textStyle20W700Blue(context),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight * .005),
          child: BlocConsumer<AuthBloc, AuthStates>(
            listener: (context, state) {
              if (state is VerificationOtpSuccess) {
                customAwesomeDialog(
                  context: context,
                  isSuccess: true,
                  title: 'Verification Successful',
                  description:
                      'Your OTP has been verified successfully. You can now reset your password',
                  buttonText: 'Continue to Reset Password',
                  onPressed: () {
                    GoRouter.of(context).push(
                      Routes.resetPasswordViewId,
                      extra: {
                        'email': widget.email,
                        'otp': otpControllers.map((e) => e.text).join(),
                      },
                    );
                  },
                );
              } else if (state is VerificationOtpFailure) {
                customAwesomeDialog(
                  context: context,
                  title: 'Verification Failed',
                  description: state.errorMessage,
                  buttonText: 'Try Again!',
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
                    state is VerificationOtpLoading
                        ? null
                        : () {
                          if (_formKey.currentState!.validate()) {
                            final otp =
                                otpControllers.map((e) => e.text).join();
                            context.read<AuthBloc>().add(
                              VerifyOtpEvent(email: widget.email, otp: otp),
                            );
                          } else {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                backgroundColor: kAppPrimaryBlueColor,
                child:
                    state is VerificationOtpLoading
                        ? const CustomCircleIndicator()
                        : CustomTitle(title: 'Verify Otp'),
              );
            },
          ),
        ),
      ],
    );
  }
}
