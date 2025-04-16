import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_view_body.dart';

import '../../../../core/helper/const_variables.dart';
import '../../../../core/utilities/custom_app_bar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextBlackPrimaryColor,
        text: 'Edit Profile',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const CustomFlexibleWidget(child: EditProfileViewBody()),
    );
  }
}
