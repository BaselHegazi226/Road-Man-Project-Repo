import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_man_project/core/utilities/routes.dart';
import 'package:road_man_project/features/_08_job_view/data/model/suggested_jobs_item_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/price_monthly_subscription_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/track_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item_section.dart';

class SuggestedJobsItem extends StatelessWidget {
  const SuggestedJobsItem({super.key, required this.suggestedJobsItemModel});
  final SuggestedJobsItemModel suggestedJobsItemModel;
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
            TrackLocationSection(
              title: suggestedJobsItemModel.trackLocationTitle,
              subTitle: suggestedJobsItemModel.trackLocationSubtitle,
              image: suggestedJobsItemModel.trackLocationImage,
              suggestedJobsItemModel: suggestedJobsItemModel,
            ),
            PriceMonthlySubscriptionSection(
              price: suggestedJobsItemModel.price,
              subscriptionType: suggestedJobsItemModel.subscriptionType,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: WorkingTimeSection(
                title1: suggestedJobsItemModel.workingTimeSectionTitle1,
                title2: suggestedJobsItemModel.workingTimeSectionTitle2,
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
