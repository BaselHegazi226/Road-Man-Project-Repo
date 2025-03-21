import 'package:flutter/material.dart';

import 'suggested_jobs_item_list_view.dart';
import 'two_title.dart';

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
