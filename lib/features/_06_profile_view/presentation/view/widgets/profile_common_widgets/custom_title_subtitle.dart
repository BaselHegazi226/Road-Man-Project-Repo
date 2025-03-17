import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'custom_profile_title.dart';

class CustomTitleSubtitle extends StatelessWidget {
  const CustomTitleSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });
  final String title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        CustomProfileTitle(title: title),
        Text(
          subTitle,
          style: TextStyle(
            color: kTextPrimaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
