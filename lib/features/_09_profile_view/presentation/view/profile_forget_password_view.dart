import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_app_bar.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/08_profile_forget_password_widgets/profile_forget_password_view_body.dart';

class ProfileForgetPasswordView extends StatelessWidget {
  const ProfileForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        context,
        generalColor: kAppPrimaryBlueColor,
        text: 'Forget Password',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const CustomFlexibleWidget(child: ProfileForgetPasswordViewBody()),
    );
  }
}
