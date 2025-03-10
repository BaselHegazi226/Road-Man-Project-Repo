import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_widgets/verification_otp_fields.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
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
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: VerificationOtpFields(
            formKey: _formKey,
            autoValidateMode: autoValidateMode,
          ),
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
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                setState(() {
                  print("don't enter otp");
                });
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                  print('accept');
                });
              }
            },
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(title: 'Verify'),
          ),
        ),
      ],
    );
  }
}
