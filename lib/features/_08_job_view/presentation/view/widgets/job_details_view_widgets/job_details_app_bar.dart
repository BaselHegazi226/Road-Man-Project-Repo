import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_05_home_view/presentation/view/widgets/custom_dashboard_widgets/open_dashboard.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_dashboard_view_body.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../../../core/utilities/base_text_styles.dart';

AppBar jobDetailsAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: kAppPrimaryBlueColor,
    leading: IconButton(
      padding: EdgeInsets.symmetric(horizontal: 16),
      onPressed: () {
        GoRouter.of(context).pop();
      },
      icon: Icon(CupertinoIcons.back, color: kSecondlyLightWhiteColor),
    ),
    actions: [
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        onPressed: () {
          openDashboard(context, const JobViewDashboardViewBody());
        },
        icon: Icon(Icons.menu_outlined, color: kSecondlyLightWhiteColor),
      ),
    ],
    title: Text(
      'Job Details',
      style: AfacadTextStyles.textStyle20W500LightWhite,
    ),
    centerTitle: true,
  );
}
