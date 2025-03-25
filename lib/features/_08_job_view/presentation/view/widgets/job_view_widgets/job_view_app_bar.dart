import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../_05_home_view/presentation/view/widgets/custom_dashboard_widgets/open_dashboard.dart';
import 'job_view_dashboard_view_body.dart';

AppBar jobViewAppbar(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final iconSize = screenWidth * 0.07; // حجم الأيقونة متناسب مع العرض

  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      icon: Icon(
        Icons.menu_outlined,
        color: kEditProfileIconColor,
        size: iconSize, // حجم الأيقونة ديناميكي
      ),
      onPressed: () => openDashboard(context, const JobViewDashboardViewBody()),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
        icon: Icon(
          Icons.notifications_outlined,
          color: kTextBlackPrimaryColor,
          size: iconSize, // حجم الأيقونة ديناميكي
        ),
        onPressed: () {},
      ),
    ],
  );
}
