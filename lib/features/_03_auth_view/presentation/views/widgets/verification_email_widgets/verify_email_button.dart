import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/core/utilities/custom_circle_indicator.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';

import '../../../../../../core/helper/const_variables.dart';

class VerifyEmailButton extends StatelessWidget {
  const VerifyEmailButton({
    super.key,
    required this.formKey,
    required this.isLoading,
    required this.sendAgainIsLoading,
    required this.otpControllers,
    required this.email,
    required this.onValidationFailed,
  });

  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final bool sendAgainIsLoading;
  final List<TextEditingController> otpControllers;
  final String email;
  final VoidCallback onValidationFailed;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed:
          isLoading || sendAgainIsLoading
              ? null
              : () {
                if (formKey.currentState!.validate()) {
                  final otp = otpControllers.map((e) => e.text).join();
                  context.read<AuthBloc>().add(
                    VerifyEmailEvent(email: email, otp: otp),
                  );
                } else {
                  onValidationFailed();
                }
              },
      backgroundColor: kAppPrimaryBlueColor,
      child:
          isLoading
              ? const CustomCircleIndicator()
              : const CustomTitle(title: 'Verify Email'),
    );
  }
}
