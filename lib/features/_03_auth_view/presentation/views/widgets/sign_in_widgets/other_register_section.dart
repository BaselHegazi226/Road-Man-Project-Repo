import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class OtherRegisterSection extends StatelessWidget {
  const OtherRegisterSection({
    super.key,
    required this.onTap,
    required this.blackText,
    required this.blueText,
  });
  final void Function()? onTap;
  final String blackText, blueText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 2,
        children: [
          Text(
            blackText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              letterSpacing: -.304,
              height: 1.5,
              color: kTextPrimaryColor,
            ),
          ),
          Text(
            blueText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: -.304,
              height: 1.5,
              color: kAppPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
