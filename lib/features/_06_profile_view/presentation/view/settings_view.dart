import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../core/helper/class_const_functions.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextPrimaryColor,
        text: 'Settings',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}
