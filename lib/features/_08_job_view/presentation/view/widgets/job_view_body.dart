import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_search_bar_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_item_section.dart';

class JobViewBody extends StatelessWidget {
  const JobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          JobViewSearchBarSection(),
          SuggestedJobsItemSection(),
          RecentJobsSection(),
        ],
      ),
    );
  }
}
