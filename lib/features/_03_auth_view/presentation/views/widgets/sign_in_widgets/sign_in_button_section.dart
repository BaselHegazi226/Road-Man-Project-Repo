import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: CustomTextButton(
            onPressed: () {},
            backgroundColor: kAppPrimaryBlueColor,
            child: CustomTitle(
              title: 'Sign in',
              textColor: kSecondlyLightWhiteColor,
              size: 20,
            ),
          ),
        ),
        CustomTextButton(
          onPressed: () {},
          backgroundColor: kSecondlyLightWhiteColor,
          borderColor: kAppPrimaryBlueColor,
          child: CustomTitle(
            title: 'Continue as a Guest',
            textColor: kAppPrimaryBlueColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
