import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';

class RecentJobsCardPriceSection extends StatelessWidget {
  const RecentJobsCardPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Text(
          '\$42 - \$48k /month',
          style: TextStyle(
            color: Color(0xff8A8C90),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
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
            style: TextStyle(
              color: kTextPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
