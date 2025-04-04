import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_05_home_view/presentation/view/widgets/custom_dashboard_widgets/custom_dashboard_icon_title.dart';

import '../../../../../_06_profile_view/presentation/view/widgets/profile_common_widgets/profile_user_info.dart';
import 'job_view_dashboard_items_section.dart';

class JobViewDashboardViewBody extends StatelessWidget {
  const JobViewDashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 64, bottom: 32),
      child: Column(
        spacing: 8,
        children: [
          const ProfileUserInfo(),
          Divider(thickness: .5, color: kLogoutLineColor),
          const JobViewDashboardItemsSection(),
          const Spacer(),
          Divider(thickness: .5, color: kLogoutLineColor),
          CustomDrawerIconTitle(
            iconData: Icons.logout,
            iconColor: Colors.red,
            title: 'Log out',
            textColor: Colors.red,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
