import 'package:flutter/cupertino.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/price_monthly_subscription_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/track_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item_section.dart';

class SuggestedJobsItem extends StatelessWidget {
  const SuggestedJobsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          TrackLocationSection(),
          PriceMonthlySubscriptionSection(),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: WorkingTimeSection(onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
