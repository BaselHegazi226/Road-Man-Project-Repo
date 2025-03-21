import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/helper/const_variables.dart';

class RecentJobCardLocationSection extends StatelessWidget {
  const RecentJobCardLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: kAppPrimaryBlueColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                FontAwesomeIcons.linkedinIn,
                color: kAppPrimaryWhiteColor,
                size: 24,
              ),
            ),
            Text(
              'LinkedIn | Remote',
              style: TextStyle(
                color: Color(0xff8A8C90),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          '30days left',
          style: TextStyle(
            color: Color(0xff8A8C90),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
