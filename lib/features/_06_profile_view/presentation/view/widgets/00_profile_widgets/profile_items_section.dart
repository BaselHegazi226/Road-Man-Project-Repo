import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/00_profile_widgets/profile_item.dart';

import '../../../../data/models/profile/profile_item_model.dart';

class ProfileItemsSection extends StatelessWidget {
  const ProfileItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileItemModel> profileItemModelList = [
      ProfileItemModel(
        prefixIcon: Icons.edit,
        title: 'Edit Profile',
        onTap: () {
          GoRouter.of(context).push(Routes.editProfileViewId);
        },
      ),
      ProfileItemModel(
        prefixIcon: Icons.settings,
        title: 'Settings',
        onTap: () {
          GoRouter.of(context).push(Routes.settingsViewId);
        },
      ),
      ProfileItemModel(
        prefixIcon: Icons.info_outline_rounded,
        title: 'About App',
        onTap: () {
          GoRouter.of(context).push(Routes.aboutAppViewId);
        },
      ),
      ProfileItemModel(
        prefixIcon: Icons.privacy_tip_outlined,
        title: 'Privacy Policy',
        onTap: () {
          GoRouter.of(context).push(Routes.privacyPolicyViewId);
        },
      ),
      ProfileItemModel(
        prefixIcon: Icons.help_outline_outlined,
        title: 'FAQ',
        onTap: () {
          GoRouter.of(context).push(Routes.faqViewId);
        },
      ),
      ProfileItemModel(prefixIcon: Icons.logout, title: 'Logout', onTap: () {}),
    ];
    return Column(
      children:
          profileItemModelList
              .map((item) => ProfileItem(profileItemModel: item))
              .toList(),
    );
  }
}
