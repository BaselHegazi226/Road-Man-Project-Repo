import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../_05_home_view/presentation/view/widgets/home_common_widgets/home_const_list.dart';
import 'job_view_dashboard_item.dart';

class JobViewDrawerItemsSection extends StatelessWidget {
  const JobViewDrawerItemsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: HomeConstList.logOutItemsSectionList.length,
      itemBuilder: (context, index) {
        final item = HomeConstList.logOutItemsSectionList[index];
        return JobViewDashboardItem(
          customDrawerItemModel: item,
          onTap:
              item.routeName.isNotEmpty
                  ? () => GoRouter.of(context).push(item.routeName)
                  : null,
        );
      },
    );
  }
}
