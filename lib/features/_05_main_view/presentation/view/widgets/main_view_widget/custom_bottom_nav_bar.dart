import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'custom_tab_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * .08,
      decoration: BoxDecoration(
        color: kAppPrimaryBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(4, (index) {
          return CustomTabBarItem(
            index: index,
            isSelected: currentIndex == index,
            onTap: () => onTap(index),
            screenWidth: screenWidth,
          );
        }),
      ),
    );
  }
}
