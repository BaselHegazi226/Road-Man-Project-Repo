import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/00_profile_widgets/profile_items_section.dart';

import '../profile_common_widgets/profile_user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: Column(children: [ProfileUserInfo(), ProfileItemsSection()]),
    );
  }
}
