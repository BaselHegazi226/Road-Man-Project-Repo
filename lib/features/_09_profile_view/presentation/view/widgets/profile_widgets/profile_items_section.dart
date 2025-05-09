import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view/widgets/profile_widgets/profile_item.dart';

import '../00_profile_common_widgets/profile_const_list.dart';

class ProfileItemsSection extends StatelessWidget {
  const ProfileItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: ProfileConstList.profileItemModelList.length,
      itemBuilder: (context, index) {
        final item = ProfileConstList.profileItemModelList[index];
        return ProfileItem(
          profileItemModel: item,
          onTap:
              item.routeName.isNotEmpty
                  ? () => GoRouter.of(context).push(item.routeName)
                  : null,
        );
      },
    );
  }
}
