import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/class_const_functions.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/03_about_app_widgets/about_app_view_body.dart';

import '../../../../core/helper/const_variables.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextPrimaryColor,
        text: 'About App',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: AboutAppViewBody(),
    );
  }
}
