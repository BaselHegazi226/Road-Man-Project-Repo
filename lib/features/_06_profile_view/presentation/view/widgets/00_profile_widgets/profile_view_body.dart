import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/00_profile_widgets/profile_items_section.dart';

import '../profile_common_widgets/profile_user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 32,
        children: [ProfileUserInfo(), ProfileItemsSection()],
      ),
    );
  }
}
