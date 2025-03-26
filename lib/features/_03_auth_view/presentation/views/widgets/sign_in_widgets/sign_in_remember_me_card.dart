import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class RememberMeCard extends StatelessWidget {
  const RememberMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.09, // نسبة من عرض الشاشة
      height: screenWidth * 0.09, // الحفاظ على الشكل المربع بنفس النسبة
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
          screenWidth * 0.03,
        ), // نسبة من العرض
        border: Border.all(
          color: kSecondlyDarkWhiteColor,
          width: screenWidth * 0.01, // نسبة من العرض
        ),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            Icons.check_box_outline_blank_rounded,
            color: Colors.transparent,
            size: screenWidth * 0.07, // نسبة من العرض
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
