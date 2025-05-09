import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          textAlign: TextAlign.center,
          'Change Password',
          style: AfacadTextStyles.textStyle16W600HBlue(context).copyWith(
            color: kAppPrimaryWrongColor,
            decoration: TextDecoration.underline,
            decorationColor: kAppPrimaryWrongColor.withAlpha(126),
          ),
        ),
      ),
    );
  }
}
