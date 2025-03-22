import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_item_list_view.dart';

import '../job_view_widgets/two_title.dart';

class SuggestedJobsItemSection extends StatelessWidget {
  const SuggestedJobsItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        TwoTitle(
          title1: 'Suggested jobs',
          title2: 'View all',
          title2onPressed: () {},
        ),
        SuggestedJobsItemListView(),
      ],
    );
  }
}
