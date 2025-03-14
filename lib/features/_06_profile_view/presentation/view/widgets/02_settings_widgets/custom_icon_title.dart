import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class CustomIconTitle extends StatelessWidget {
  const CustomIconTitle({
    super.key,
    required this.iconData,
    required this.title,
  });
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: [
        Icon(iconData, size: 24, color: kIconSettingsColor),
        Text(
          title,
          style: TextStyle(
            color: kTextPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
