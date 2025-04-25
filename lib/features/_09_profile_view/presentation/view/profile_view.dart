import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/00_profile_widgets/profile_view_body.dart';

import '../../../../core/utilities/base_text_styles.dart';
import '../../../../core/utilities/custom_app_bar.dart';

class ProfileView1 extends StatelessWidget {
  const ProfileView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        text: 'Profile',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const ProfileViewBody(),
    );
  }
}

class ProfileView2 extends StatelessWidget {
  const ProfileView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: AppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: AfacadTextStyles.textStyle20W600Black(context),
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
