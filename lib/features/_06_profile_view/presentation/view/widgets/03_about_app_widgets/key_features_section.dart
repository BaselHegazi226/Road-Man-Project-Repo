import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'key_feature_items_section.dart';

class KeyFeaturesSection extends StatelessWidget {
  const KeyFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Key Features',
          style: TextStyle(
            color: kTextBlackPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        KeyFeatureItemsSection(),
      ],
    );
  }
}
