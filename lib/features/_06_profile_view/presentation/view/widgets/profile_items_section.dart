import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/profile_item.dart';

import '../../../data/model/profile_item_model.dart';

class ProfileItemsSection extends StatefulWidget {
  const ProfileItemsSection({super.key});

  @override
  State<ProfileItemsSection> createState() => _ProfileItemsSectionState();
}

class _ProfileItemsSectionState extends State<ProfileItemsSection> {
  final List<ProfileItemModel> profileItemModelList = [
    ProfileItemModel(
      prefixIcon: Icons.edit,
      title: 'Edit Profile',
      onTap: () {},
    ),
    ProfileItemModel(
      prefixIcon: Icons.settings,
      title: 'Settings',
      onTap: () {},
    ),
    ProfileItemModel(
      prefixIcon: Icons.info_outline_rounded,
      title: 'About App',
      onTap: () {},
    ),
    ProfileItemModel(
      prefixIcon: Icons.privacy_tip_outlined,
      title: 'Privacy Policy',
      onTap: () {},
    ),
    ProfileItemModel(
      prefixIcon: Icons.help_outline_outlined,
      title: 'FAQ',
      onTap: () {},
    ),
    ProfileItemModel(prefixIcon: Icons.logout, title: 'Logout', onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        profileItemModelList.length,
        (index) => ProfileItem(profileItemModel: profileItemModelList[index]),
      ),
    );
  }
}
