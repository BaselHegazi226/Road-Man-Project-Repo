import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card.dart';

class RecentJobsCardListView extends StatelessWidget {
  final List<JobViewCardModel> recentJobsCardItemModelList;
  const RecentJobsCardListView({
    super.key,
    required this.recentJobsCardItemModelList,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Expanded(
      child: ListView.builder(
        itemCount: recentJobsCardItemModelList.length,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.02,
            ), // مسافة متجاوبة بين العناصر
            child: RecentJobsCard(
              recentJobsCardModel: recentJobsCardItemModelList[index],
            ),
          );
        },
      ),
    );
  }
}
