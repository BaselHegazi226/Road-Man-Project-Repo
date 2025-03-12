import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomTabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  const CustomTabBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        if (isSelected) // عندما يتم التحديد
          Positioned(
            top: -64,
            child: Column(
              spacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kAppPrimaryWhiteColor,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kAppPrimaryBlueColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 24, color: kAppPrimaryWhiteColor),
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: kAppPrimaryWhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        else // الأيقونة العادية فقط بدون نص
          Icon(icon, size: 24, color: kTabBarIconColor),
      ],
    );
  }
}
