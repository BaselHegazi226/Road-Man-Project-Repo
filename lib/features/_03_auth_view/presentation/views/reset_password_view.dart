import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';

import '../../../../core/helper/const_variables.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        text: 'Reset Password',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}
