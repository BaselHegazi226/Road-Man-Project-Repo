import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/00_profile_widgets/profile_item.dart';

import '../../../../data/models/profile/icon_text_item_model.dart';

class ProfileItemsSection extends StatelessWidget {
  const ProfileItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconTextItemModel> profileItemModelList = [
      IconTextItemModel(
        prefixIcon: Icons.edit,
        title: 'Edit Profile',
        onTap: () {
          GoRouter.of(context).push(Routes.editProfileViewId);
        },
      ),
      IconTextItemModel(
        prefixIcon: Icons.settings,
        title: 'Settings',
        onTap: () {
          GoRouter.of(context).push(Routes.settingsViewId);
        },
      ),
      IconTextItemModel(
        prefixIcon: Icons.info_outline_rounded,
        title: 'About App',
        onTap: () {
          GoRouter.of(context).push(Routes.aboutAppViewId);
        },
      ),
      IconTextItemModel(
        prefixIcon: Icons.privacy_tip_outlined,
        title: 'Privacy Policy',
        onTap: () {
          GoRouter.of(context).push(Routes.privacyPolicyViewId);
        },
      ),
      IconTextItemModel(
        prefixIcon: Icons.help_outline_outlined,
        title: 'FAQ',
        onTap: () {
          GoRouter.of(context).push(Routes.faqViewId);
        },
      ),
      IconTextItemModel(
        prefixIcon: Icons.logout,
        iconColor: Colors.red,
        title: 'Logout',
        textColor: Colors.red,
        onTap: () {
          GoRouter.of(context).push(Routes.logoutViewId);
        },
      ),
    ];
    return Column(
      children:
          profileItemModelList
              .map((item) => ProfileItem(profileItemModel: item))
              .toList(),
    );
  }
}
