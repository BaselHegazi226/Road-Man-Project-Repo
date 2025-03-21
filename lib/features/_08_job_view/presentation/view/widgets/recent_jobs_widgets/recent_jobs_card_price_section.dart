import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class RecentJobsCardPriceSection extends StatelessWidget {
  const RecentJobsCardPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(
          '\$42 - \$48k /month',
          style: AfacadTextStyles.textStyle14W400Grey,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xff8A8C90), width: 1.5),
          ),
          child: Text(
            'Full-Time',
            style: AfacadTextStyles.textStyle14W400Black,
          ),
        ),
      ],
    );
  }
}
