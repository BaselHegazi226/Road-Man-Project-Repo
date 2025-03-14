import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomProfileTitle extends StatelessWidget {
  const CustomProfileTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: kTextPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
