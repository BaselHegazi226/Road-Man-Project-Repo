import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/04_privacy_policy_widgets/privacy_policy_items_section.dart';

import '../profile_common_widgets/custom_profile_blue_text_button.dart';
import '../profile_common_widgets/custom_profile_title.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomProfileTitle(
            title: 'Protecting your data is our priority',
          ),
          const PrivacyPolicyItemsSection(),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: CustomProfileBlueTextButton(
              text: 'I agree to the privacy policy',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
