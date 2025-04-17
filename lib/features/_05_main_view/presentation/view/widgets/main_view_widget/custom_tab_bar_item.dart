import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class CustomTabBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final double screenWidth;
  final VoidCallback onTap;

  const CustomTabBarItem({
    super.key,
    required this.index,
    required this.isSelected,
    required this.screenWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final whiteLineHeight = screenWidth * 0.04;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? screenWidth * 0.3 : null,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? screenWidth * 0.04 : 0,
          vertical: screenWidth * 0.015,
        ),
        margin: const EdgeInsets.only(top: 4),
        decoration:
            isSelected
                ? BoxDecoration(
                  color: kAppPrimaryWhiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(screenWidth * .01),
                    bottom: Radius.circular(screenWidth * .8),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                )
                : null,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getIcon(index),
                  color:
                      isSelected ? kAppPrimaryBlueColor : kAppPrimaryWhiteColor,
                ),
                if (isSelected) ...[
                  SizedBox(width: screenWidth * .02),
                  Text(
                    _getText(index),
                    style: AfacadTextStyles.textStyle14W700H150Blue,
                  ),
                ],
              ],
            ),
            if (isSelected)
              Positioned(
                top: -whiteLineHeight * 1.6,
                child: const Icon(
                  CupertinoIcons.flag_fill,
                  size: 24,
                  color: kAppPrimaryWhiteColor,
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return isSelected ? Icons.home : Icons.home_outlined;
      case 1:
        return isSelected ? Icons.local_library : Icons.local_library_outlined;
      case 2:
        return isSelected ? Icons.work : Icons.work_history_outlined;
      case 3:
        return isSelected ? Icons.person : Icons.person_outline;
      default:
        return Icons.help_outline;
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Learn";
      case 2:
        return "Jobs";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
