import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';

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
              style: AfacadTextStyles.textStyle14W400Grey,
            ),
          ],
        ),
        Text('30days left', style: AfacadTextStyles.textStyle12W400Grey),
      ],
    );
  }
}
