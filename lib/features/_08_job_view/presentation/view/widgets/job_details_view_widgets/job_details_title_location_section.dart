import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class JobDetailsTitleLocationSection extends StatelessWidget {
  const JobDetailsTitleLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        Text(
          'Front End Developer',
          style: AfacadTextStyles.textStyle20W600Black,
        ),
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Google, Inc', style: AfacadTextStyles.textStyle16W400Grey),
            Text('Cairo, Egypt', style: AfacadTextStyles.textStyle16W400Grey),
          ],
        ),
      ],
    );
  }
}
