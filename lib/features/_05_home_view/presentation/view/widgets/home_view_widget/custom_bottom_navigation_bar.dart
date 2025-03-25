import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'custom_tab_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.tabController,
    required this.backgroundColor,
  });
  final TabController tabController;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .08,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: kAppPrimaryBlueColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MediaQuery.sizeOf(context).width * 0.02),
          topRight: Radius.circular(MediaQuery.sizeOf(context).width * 0.02),
        ),
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        controller: tabController,
        dividerColor: Colors.transparent, // إزالة أي فاصل افتراضي
        tabs: List.generate(4, (index) {
          return CustomTabBarItem(
            icon: _getIcon(index),
            text: _getText(index),
            isSelected: tabController.index == index,
            backgroundColor: backgroundColor,
          );
        }),
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.local_library_outlined;
      case 2:
        return Icons.work_history_outlined;
      case 3:
        return Icons.person_outline_outlined;
      default:
        return Icons.home_outlined;
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Learn";
      case 2:
        return "Job";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
