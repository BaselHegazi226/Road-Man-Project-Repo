import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/forget_password_widgets/forget_password_view_body.dart';

import '../../../../core/helper/class_const_functions.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        text: 'Forget Password',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: ForgetPasswordViewBody(),
    );
  }
}
