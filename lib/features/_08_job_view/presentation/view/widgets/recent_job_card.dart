import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_job_card_location_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_job_card_title_section.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_card_price_section.dart';

class RecentJobsCard extends StatelessWidget {
  const RecentJobsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffE6E8EE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 8,
        children: [
          RecentJobCardTitleSection(),
          RecentJobsCardPriceSection(),
          RecentJobCardLocationSection(),
        ],
      ),
    );
  }
}
