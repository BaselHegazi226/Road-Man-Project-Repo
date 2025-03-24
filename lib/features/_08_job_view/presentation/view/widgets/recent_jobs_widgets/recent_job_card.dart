import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_job_card_title_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_widgets/recent_jobs_card_price_section.dart';

class RecentJobsCard extends StatelessWidget {
  final JobViewCardModel recentJobsCardModel;
  const RecentJobsCard({super.key, required this.recentJobsCardModel});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 8,
              children: [
                RecentJobCardTitleSection(
                  title: recentJobsCardModel.title,
                  recentJobsCardModel: recentJobsCardModel,
                ),
                RecentJobsCardPriceSection(
                  salary: recentJobsCardModel.salary,
                  jobType: recentJobsCardModel.jobType,
                ),
              ],
            ),
            RecentJobCardLocationSection(
              company: recentJobsCardModel.company,
              location: recentJobsCardModel.location,
              timeLeft: recentJobsCardModel.timeLeft!,
            ),
          ],
        ),
      ),
    );
  }
}
