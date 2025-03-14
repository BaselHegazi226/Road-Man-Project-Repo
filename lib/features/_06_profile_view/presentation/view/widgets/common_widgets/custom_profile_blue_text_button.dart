import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomProfileBlueTextButton extends StatelessWidget {
  const CustomProfileBlueTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: kAppPrimaryBlueColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
