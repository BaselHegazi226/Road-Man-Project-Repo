import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';
import '../../../../../../core/utilities/custom_text_button.dart';
import '../../../../../../core/utilities/custom_title.dart';

class OnBoardingViewButtonSection extends StatelessWidget {
  const OnBoardingViewButtonSection({
    super.key,
    required this.skipButtonOnPressed,
    required this.nextButtonOnPressed,
  });
  final VoidCallback skipButtonOnPressed, nextButtonOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: skipButtonOnPressed,
          child: Text('Skip', style: AfacadTextStyles.textStyle18W400Blue),
        ),
        CustomTextButton(
          onPressed: nextButtonOnPressed,
          buttonWidth: MediaQuery.sizeOf(context).width * .25,
          buttonHeight: MediaQuery.sizeOf(context).height * .045,
          backgroundColor: kAppPrimaryBlueColor,
          child: CustomTitle(title: 'Next'),
        ),
      ],
    );
  }
}
