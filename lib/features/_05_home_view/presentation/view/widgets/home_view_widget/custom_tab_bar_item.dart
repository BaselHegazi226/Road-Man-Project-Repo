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
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        if (isSelected)
          Positioned(
            top: -64,
            child: Column(
              spacing: 8,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:
                            kAppPrimaryWhiteColor, // جعل الخلفية مثل لون الشاشة
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColor,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: kAppPrimaryBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          size: 24,
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
          Icon(icon, size: 24, color: kTabBarIconColor),
      ],
    );
  }
}
