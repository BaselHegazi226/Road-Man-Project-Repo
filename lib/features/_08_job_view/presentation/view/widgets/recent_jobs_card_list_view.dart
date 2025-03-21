import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_job_card.dart';

class RecentJobsCardListView extends StatelessWidget {
  const RecentJobsCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RecentJobsCard(),
          );
        },
      ),
    );
  }
}
