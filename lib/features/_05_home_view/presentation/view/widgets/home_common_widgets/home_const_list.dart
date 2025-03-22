import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utilities/routes.dart';
import '../../../../data/model/dashboard_item_model.dart';

class HomeConstList {
  static final List<DashboardItemModel> logOutItemsSectionList = [
    DashboardItemModel(
      routeName: Routes.profileViewId,
      prefixIcon: Icons.person_outline_outlined,
      title: 'Profile',
    ),
    DashboardItemModel(
      routeName: Routes.settingsViewId,
      prefixIcon: Icons.local_library_outlined,
      title: 'Learning preferences',
    ),
    DashboardItemModel(
      routeName: '',
      prefixIcon: CupertinoIcons.bookmark_solid,
      title: 'Saved',
    ),
    DashboardItemModel(
      routeName: Routes.settingsViewId,
      prefixIcon: Icons.settings,
      title: 'Settings',
    ),
    DashboardItemModel(
      routeName: Routes.aboutAppViewId,
      prefixIcon: Icons.info_outlined,
      title: 'About app',
    ),
    DashboardItemModel(
      routeName: Routes.privacyPolicyViewId,
      prefixIcon: Icons.privacy_tip_outlined,
      title: 'Privacy policy',
    ),
    DashboardItemModel(
      routeName: Routes.faqViewId,
      prefixIcon: Icons.help_outline_outlined,
      title: 'FAQ',
    ),
  ];
}
