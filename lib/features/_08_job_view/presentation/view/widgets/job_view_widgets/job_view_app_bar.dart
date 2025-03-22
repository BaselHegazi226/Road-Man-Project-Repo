import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../_05_home_view/presentation/view/widgets/custom_dashboard_widgets/open_dashboard.dart';
import 'job_view_dashboard_view_body.dart';

AppBar jobViewAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: kAppPrimaryWhiteColor,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.menu_outlined,
        color: kEditProfileIconColor,
        size: 28,
      ),
      onPressed: () => openDrawer(context, const JobViewDashboardViewBody()),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.notifications_outlined,
          color: kTextBlackPrimaryColor,
          size: 28,
        ),
        onPressed: () {},
      ),
    ],
  );
}
