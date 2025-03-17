import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/05_faq_widgets/faq_items_section.dart';

import '../profile_common_widgets/custom_profile_blue_text_button.dart';

class FaqViewBody extends StatelessWidget {
  const FaqViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        spacing: 54,
        children: [
          const FaqItemsSection(),
          CustomProfileBlueTextButton(text: 'Contact us', onPressed: () {}),
        ],
      ),
    );
  }
}
