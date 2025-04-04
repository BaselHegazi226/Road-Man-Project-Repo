import 'package:flutter/material.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/common_widgets/custom_auth_text.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/verification_widgets/verification_input_data_section.dart';
import 'package:road_man_project/generated/assets.dart';

import '../common_widgets/custom_image.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
      ), // 5% من العرض بدل 16 بكسل
      child: Column(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor:
                  screenHeight * .00085, // يمكنك ضبطه بناءً على اختبارك
              child: CustomImage(image: Assets.authVerificationImage),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.07,
            ), // 7% من الطول بدل 58 بكسل
            child: CustomAuthText(
              text:
                  'We have sent a verification code to your email or phone number. Enter the code below to complete the process.',
              textAlign: TextAlign.center,
            ),
          ),
          VerificationInputDataSection(),
        ],
      ),
    );
  }
}
