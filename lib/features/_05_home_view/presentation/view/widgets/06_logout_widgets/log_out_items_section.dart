import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home_common_widgets/home_const_list.dart';
import 'logout_item.dart';

class LogOutItemsSection extends StatelessWidget {
  const LogOutItemsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: HomeConstList.logOutItemsSectionList.length,
      itemBuilder: (context, index) {
        final item = HomeConstList.logOutItemsSectionList[index];
        return LogoutItem(
          logoutItemModel: item,
          onTap:
              item.routeName.isNotEmpty
                  ? () => GoRouter.of(context).push(item.routeName)
                  : null,
        );
      },
    );
  }
}
