import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomAuthText extends StatelessWidget {
  const CustomAuthText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
  });
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 3,
      style: TextStyle(
        color: kTextPrimaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: -.228,
        height: 1.5,
      ),
      strutStyle: StrutStyle(leading: .3, forceStrutHeight: true),
    );
  }
}
