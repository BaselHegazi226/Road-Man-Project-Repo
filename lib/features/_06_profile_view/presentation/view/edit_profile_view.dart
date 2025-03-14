import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    );
  }
}
