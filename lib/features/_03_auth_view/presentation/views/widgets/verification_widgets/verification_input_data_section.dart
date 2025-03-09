import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_text_form_field_otp.dart';
import '../../../../../../core/utilities/custom_title.dart';

class VerificationInputDataSection extends StatefulWidget {
  const VerificationInputDataSection({super.key});

  @override
  State<VerificationInputDataSection> createState() =>
      _VerificationInputDataSectionState();
}

class _VerificationInputDataSectionState
    extends State<VerificationInputDataSection> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        CustomTextFormFieldOtpPinPut(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the OTP';
            } else if (value.length < 4) {
              return 'OTP must be 4 digits';
            }
            return null;
          },
        ),
        TextButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {}
          },
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
            onPressed: () {},
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(title: 'Verify'),
          ),
        ),
      ],
    );
  }
}
