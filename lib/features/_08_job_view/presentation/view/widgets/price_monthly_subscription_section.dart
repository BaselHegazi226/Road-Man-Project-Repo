import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class PriceMonthlySubscriptionSection extends StatelessWidget {
  const PriceMonthlySubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$42- \$48k',
          style: TextStyle(
            color: kAppPrimaryBlueColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          ' /month',
          style: TextStyle(
            color: Color(0xff8A8C90),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
