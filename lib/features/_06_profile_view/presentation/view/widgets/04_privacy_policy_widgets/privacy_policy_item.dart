import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_profile_view/data/models/profile/privacy_policy_item_model.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/common_widgets/custom_title_subtitle.dart';

class PrivacyPolicyItem extends StatelessWidget {
  const PrivacyPolicyItem({super.key, required this.privacyPolicyItemModel});
  final PrivacyPolicyItemModel privacyPolicyItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomTitleSubtitle(
      title: privacyPolicyItemModel.title,
      subTitle: privacyPolicyItemModel.subTitle,
    );
  }
}
