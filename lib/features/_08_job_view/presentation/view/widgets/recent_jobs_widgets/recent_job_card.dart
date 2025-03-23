import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card_title_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_card_price_section.dart';

import '../../../../data/model/recent_jobs_card_item_model.dart';

class RecentJobsCard extends StatelessWidget {
  final RecentJobsCardItemModel recentJobsCardItemModel;
  const RecentJobsCard({super.key, required this.recentJobsCardItemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Routes.jobDetailsViewId);
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * .15,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xffE6E8EE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 8,
          children: [
            RecentJobCardTitleSection(title: recentJobsCardItemModel.title),
            RecentJobsCardPriceSection(
              salary: recentJobsCardItemModel.salary,
              jobType: recentJobsCardItemModel.jobType,
            ),
            RecentJobCardLocationSection(
              company: recentJobsCardItemModel.company,
              location: recentJobsCardItemModel.location,
              timeLeft: recentJobsCardItemModel.timeLeft,
            ),
          ],
        ),
      ),
    );
  }
}
