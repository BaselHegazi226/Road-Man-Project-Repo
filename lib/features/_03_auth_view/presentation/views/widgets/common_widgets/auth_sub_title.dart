import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class AuthSubTitle extends StatelessWidget {
  const AuthSubTitle({super.key, required this.subTitle});
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      subTitle,
      style: TextStyle(
        color: kTextBlackPrimaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        height: 1.5,
        letterSpacing: -0.304,
      ),
    );
  }
}
