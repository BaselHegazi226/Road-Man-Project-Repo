import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class PriceMonthlySubscriptionSection extends StatelessWidget {
  const PriceMonthlySubscriptionSection({
    super.key,
    required this.price,
    required this.subscriptionType,
  });
  final String price, subscriptionType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(price, style: AfacadTextStyles.textStyle16W600HBlue),
        Text(subscriptionType, style: AfacadTextStyles.textStyle14W400Grey),
      ],
    );
  }
}
