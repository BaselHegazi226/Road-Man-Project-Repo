import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/profile_items_section.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/profile_user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [ProfileUserInfo(), ProfileItemsSection()]),
    );
  }
}
