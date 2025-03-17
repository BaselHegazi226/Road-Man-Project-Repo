import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/common_widgets/profile_user_info.dart';

import 'custom_log_out_icon_title.dart';
import 'log_out_items_section.dart';

class LogoutViewBody extends StatelessWidget {
  const LogoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        spacing: 32,
        children: [
          ProfileUserInfo(),
          Divider(thickness: 1, color: kLogoutLineColor),
          LogOutItemsSection(),
          Spacer(),
          Divider(thickness: 1, color: kLogoutLineColor),
          CustomLogOutIconTitle(
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
