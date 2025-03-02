import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_text_button.dart';
import 'package:road_man_project/core/utilities/custom_text_form_field_otp.dart';
import 'package:road_man_project/core/utilities/custom_title.dart';

import '../../../../../../core/helper/pin_themes.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 24,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 48, bottom: 8),
            child: Text(
              textAlign: TextAlign.center,
              'We have sent a verification code to your email or phone number. Enter the code below to complete the process',
              style: TextStyle(
                color: kTextPrimaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.5,
                letterSpacing: -.228,
              ),
            ),
          ),
          CustomTextFormFieldOtpPinPut(
            defaultPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
              context,
            ),
            disabledPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
              context,
            ),
            focusedPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
              context,
              borderColor: kAppPrimaryBlueColor,
            ),
            errorPinTheme: PinThemesPinPutOtpClass.customPinThemeFunc(
              context,
              borderColor: kErrorColor,
            ),
            validator: (value) {
              return '';
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Send again ?',
              style: TextStyle(
                color: kAppPrimaryBlueColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: CustomTextButton(
              child: CustomTitle(title: 'Verify'),
              onPressed: () {},
              backgroundColor: kAppPrimaryBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
