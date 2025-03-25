import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class CustomTabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Color backgroundColor; // خلفية متغيرة حسب الشاشة

  const CustomTabBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Positioned(
            top: -screenHeight * 0.073,
            child: Column(
              spacing: screenHeight * 0.015,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: kAppPrimaryWhiteColor,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColor,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        decoration: BoxDecoration(
                          color: kAppPrimaryBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          size:
                              screenWidth *
                              0.06, // جعل الأيقونة متناسبة مع العرض
                          color: kAppPrimaryWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  text,
                  style: AfacadTextStyles.textStyle14W500White.copyWith(
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        else
          Icon(
            icon,
            size: screenWidth * 0.06, // جعل حجم الأيقونة متناسبًا
            color: kTabBarIconColor,
          ),
      ],
    );
  }
}
