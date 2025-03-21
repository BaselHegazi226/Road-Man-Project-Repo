import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class PriceMonthlySubscriptionSection extends StatelessWidget {
  const PriceMonthlySubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('\$42- \$48k', style: AfacadTextStyles.textStyle16W600HBlue),
        Text(' /month', style: AfacadTextStyles.textStyle14W400Grey),
      ],
    );
  }
}
