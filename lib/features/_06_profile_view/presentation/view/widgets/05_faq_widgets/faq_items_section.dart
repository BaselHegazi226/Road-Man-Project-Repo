import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/05_faq_widgets/faq_item.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/common_widgets/const_list.dart';

class FaqItemsSection extends StatelessWidget {
  const FaqItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children:
          ConstList.faqItemModelList
              .map((item) => FaqItem(faqItemModel: item))
              .toList(),
    );
  }
}
