import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class TwoTitle extends StatelessWidget {
  const TwoTitle({
    super.key,
    required this.title1,
    required this.title2,
    required this.title2onPressed,
  });
  final String title1, title2;
  final VoidCallback? title2onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style: TextStyle(
            color: kTextBlackPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: title2onPressed,
          child: Text(
            title2,
            style: TextStyle(
              color: kAppPrimaryBlueColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
