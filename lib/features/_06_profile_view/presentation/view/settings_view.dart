import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/02_settings_widgets/settings_view_body.dart';

import '../../../../core/helper/class_const_functions.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextBlackPrimaryColor,
        text: 'Settings',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const SettingsViewBody(),
    );
  }
}
