import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../../core/helper/const_functions.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static String id = '/ForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(text: 'Forget Password'),
    );
  }
}
