import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/00_profile_widgets/profile_view_body.dart';

import '../../../../core/utilities/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        generalColor: kTextBlackPrimaryColor,
        text: 'Profile',
        onPressed: () {},
      ),
      body: const ProfileViewBody(),
    );
  }
}
