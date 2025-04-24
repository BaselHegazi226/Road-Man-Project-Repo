import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'half_circle_clipper.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background circle
        Container(
          width: screenSize.width * 0.248,
          height: screenSize.height * 0.1094,
          decoration: BoxDecoration(
            color: kSecondlyDarkWhiteColor,
            shape: BoxShape.circle,
          ),
        ),

        // Progress circle (partially visible - 50%)
        Container(
          width: screenSize.width * 0.248,
          height: screenSize.height * 0.1094,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment(0.50, 1.00),
              end: Alignment(0.50, 0.00),
              colors: [Color(0xFF052C6E), Color(0xFF3D76D5)],
            ),
          ),
          child: ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(color: Colors.transparent),
          ),
        ),

        // Percentage text
        Text(
          '50%',
          style: AfacadTextStyles.textStyle20W600Black(
            context,
          ).copyWith(color: kSecondlyDarkWhiteColor),
        ),
      ],
    );
  }
}
