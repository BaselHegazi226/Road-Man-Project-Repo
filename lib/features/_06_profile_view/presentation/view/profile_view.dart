import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/class_const_functions.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/00_profile_widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        generalColor: kTextPrimaryColor,
        text: 'Profile',
        onPressed: () {},
      ),
      body: const ProfileViewBody(),
    );
  }
}
