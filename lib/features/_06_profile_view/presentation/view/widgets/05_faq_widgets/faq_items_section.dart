import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/05_faq_widgets/faq_item.dart';

import '../profile_common_widgets/profile_const_list.dart';

class FaqItemsSection extends StatelessWidget {
  const FaqItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      spacing: screenHeight * .03,
      children:
          ProfileConstList.faqItemModelList
              .map((item) => FaqItem(faqItemModel: item))
              .toList(),
    );
  }
}
