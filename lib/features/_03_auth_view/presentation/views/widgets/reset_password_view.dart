import 'package:flutter/material.dart';

import '../../../../../core/helper/const_functions.dart';
import '../../../../../core/helper/const_variables.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(text: 'Reset Password'),
    );
  }
}
