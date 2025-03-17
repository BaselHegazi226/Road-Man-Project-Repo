import 'package:flutter/material.dart';
import 'package:road_man_project/features/_05_home_view/data/model/logout_item_model.dart';

import 'logout_item.dart';

class LogOutItemsSection extends StatelessWidget {
  const LogOutItemsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final List<LogoutItemModel> logOutItemsSectionList = [
      LogoutItemModel(
        onTap: () {},
        prefixIcon: Icons.person_outline_outlined,
        title: 'Profile',
      ),
      LogoutItemModel(
        onTap: () {},
        prefixIcon: Icons.local_library_outlined,
        title: 'Learning preferences',
      ),
      LogoutItemModel(onTap: () {}, prefixIcon: Icons.bookmark, title: 'Saved'),
      LogoutItemModel(
        onTap: () {},
        prefixIcon: Icons.settings,
        title: 'Settings',
      ),
      LogoutItemModel(
        onTap: () {},
        prefixIcon: Icons.info_outlined,
        title: 'About app',
      ),
      LogoutItemModel(
        onTap: () {},
        prefixIcon: Icons.privacy_tip_outlined,
        title: 'Privacy policy',
      ),
      LogoutItemModel(
        onTap: () {},
        prefixIcon: Icons.help_outline_outlined,
        title: 'FAQ',
      ),
    ];
    return Column(
      children:
          logOutItemsSectionList
              .map((item) => LogoutItem(logoutItemModel: item))
              .toList(),
    );
  }
}
