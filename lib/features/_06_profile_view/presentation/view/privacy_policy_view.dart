import 'package:flutter/material.dart';

import '../../../../core/helper/class_const_functions.dart';
import '../../../../core/helper/const_variables.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: ConstFunctions.customAppBar(
        backgroundColor: kAppPrimaryWhiteColor,
        generalColor: kTextPrimaryColor,
        text: 'Privacy Policy',
        onPressed: () {},
      ),
    );
  }
}
