import 'package:flutter/material.dart';

import '../../../../../../core/utilities/routes.dart';
import '../../../../data/model/logout_item_model.dart';

class HomeConstList {
  static final List<LogoutItemModel> logOutItemsSectionList = [
    LogoutItemModel(
      routeName: Routes.profileViewId,
      prefixIcon: Icons.person_outline_outlined,
      title: 'Profile',
    ),
    LogoutItemModel(
      routeName: Routes.settingsViewId,
      prefixIcon: Icons.local_library_outlined,
      title: 'Learning preferences',
    ),
    LogoutItemModel(routeName: '', prefixIcon: Icons.bookmark, title: 'Saved'),
    LogoutItemModel(
      routeName: Routes.settingsViewId,
      prefixIcon: Icons.settings,
      title: 'Settings',
    ),
    LogoutItemModel(
      routeName: Routes.aboutAppViewId,
      prefixIcon: Icons.info_outlined,
      title: 'About app',
    ),
    LogoutItemModel(
      routeName: Routes.privacyPolicyViewId,
      prefixIcon: Icons.privacy_tip_outlined,
      title: 'Privacy policy',
    ),
    LogoutItemModel(
      routeName: Routes.faqViewId,
      prefixIcon: Icons.help_outline_outlined,
      title: 'FAQ',
    ),
  ];
}
