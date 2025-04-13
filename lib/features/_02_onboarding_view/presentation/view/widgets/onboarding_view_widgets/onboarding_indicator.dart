import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: screenWidth * .02),
      width: screenWidth * .12,
      height: screenHeight * .005,
      decoration: BoxDecoration(
        color: isActive ? kAppPrimaryBlueColor : Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
