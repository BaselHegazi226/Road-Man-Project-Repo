import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_price_subscription_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_track_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item_section.dart';

class SuggestedJobsCard extends StatelessWidget {
  const SuggestedJobsCard({super.key, required this.suggestedJobsItemModel});
  final JobViewCardModel suggestedJobsItemModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(Routes.jobDetailsViewId);
      },
      child: Container(
        height: 182,
        width: MediaQuery.sizeOf(context).width * .85,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffE6E8EE),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          spacing: 16,
          children: [
            SuggestedJobsTrackLocationSection(
              title: suggestedJobsItemModel.title,
              company: suggestedJobsItemModel.company,
              location: suggestedJobsItemModel.location,
              image: suggestedJobsItemModel.logo,
              suggestedJobsItemModel: suggestedJobsItemModel,
            ),
            SuggestedJobsPriceSubscriptionSection(
              price: suggestedJobsItemModel.salary,
              subscriptionType: suggestedJobsItemModel.subscriptionType,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: WorkingTimeSection(
                jobType: suggestedJobsItemModel.jobType,
                jobLevel: suggestedJobsItemModel.jobLevel!,
                onPressed: () {
                  GoRouter.of(context).push(Routes.jobDetailsViewId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
