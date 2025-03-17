import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/01_edit_profile_widgets/edit_profile_view_body.dart';

import '../../../../core/helper/class_const_functions.dart';
import '../../../../core/helper/const_variables.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextPrimaryColor,
        text: 'Edit Profile',
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      body: CustomFlexibleWidget(child: EditProfileViewBody()),
    );
  }
}
