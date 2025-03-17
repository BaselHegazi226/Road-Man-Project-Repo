import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/00_profile_widgets/profile_item.dart';
import 'package:road_man_project/features/_06_profile_view/presentation/view/widgets/common_widgets/const_list.dart';

class ProfileItemsSection extends StatelessWidget {
  const ProfileItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          ConstList.profileItemModelList
              .map(
                (item) => ProfileItem(
                  profileItemModel: item,
                  onTap:
                      item.routeName == ''
                          ? null
                          : () {
                            GoRouter.of(context).push(item.routeName);
                          },
                ),
              )
              .toList(),
    );
  }
}
