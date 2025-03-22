import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_card_list_view.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_item_list_view.dart';

import '../job_view_widgets/two_title.dart';

class RecentJobsSection extends StatelessWidget {
  const RecentJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 16,
        children: [
          TwoTitle(
            title1: 'Recent Jobs',
            title2: 'View all',
            title2onPressed: () {},
          ),
          RecentJobsItemListView(),
          RecentJobsCardListView(),
        ],
      ),
    );
  }
}
