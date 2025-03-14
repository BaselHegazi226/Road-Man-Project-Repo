import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class CustomProfileBlueTextButton extends StatelessWidget {
  const CustomProfileBlueTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'I agree to the privacy policy',
        style: TextStyle(
          color: kAppPrimaryBlueColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
