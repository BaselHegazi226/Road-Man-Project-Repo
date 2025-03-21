import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class CustomIconTitle extends StatelessWidget {
  const CustomIconTitle({
    super.key,
    required this.iconData,
    required this.title,
    this.textColor = kTextBlackPrimaryColor,
    this.iconColor = kIconSettingsColor,
  });
  final IconData iconData;
  final String title;
  final Color textColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        Icon(iconData, size: 24, color: iconColor),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
