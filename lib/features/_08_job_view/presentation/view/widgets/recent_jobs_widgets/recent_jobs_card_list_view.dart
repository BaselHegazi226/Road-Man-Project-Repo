import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card.dart';

import '../../../../data/model/recent_jobs_card_item_model.dart';

class RecentJobsCardListView extends StatelessWidget {
  final List<RecentJobsCardItemModel> recentJobsCardItemModelList;
  const RecentJobsCardListView({
    super.key,
    required this.recentJobsCardItemModelList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: recentJobsCardItemModelList.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RecentJobsCard(
              recentJobsCardItemModel: recentJobsCardItemModelList[index],
            ),
          );
        },
      ),
    );
  }
}
