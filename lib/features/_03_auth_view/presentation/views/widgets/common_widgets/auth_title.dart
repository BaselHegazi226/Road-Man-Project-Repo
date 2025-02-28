import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: TextStyle(
        color: kTextPrimaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
