import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class SocialAuthCard extends StatelessWidget {
  const SocialAuthCard({
    super.key,
    required this.iconData,
    this.iconSize = 24,
    required this.onPressed,
  });
  final IconData iconData;
  final double iconSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.sizeOf(context).width;
    // double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: 60,
      height: 54,
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        border: Border.all(color: Color(0xffF5F5F5)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(158, 158, 158, 0.3),
            offset: Offset(4, 4),
            blurRadius: 8,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: Color.fromRGBO(158, 158, 158, 0.15),
            offset: Offset(2, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(iconData, color: kAppPrimaryBlueColor, size: iconSize),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
