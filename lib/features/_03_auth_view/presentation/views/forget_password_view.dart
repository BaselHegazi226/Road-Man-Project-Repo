import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/views/widgets/reset_password_widgets/reset_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        generalColor: kAppPrimaryBlueColor,
        text: 'Forget Password',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const ResetPasswordViewBody(),
    );
  }
}
