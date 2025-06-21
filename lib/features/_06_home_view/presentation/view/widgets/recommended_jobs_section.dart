import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'recommended_jobs_section_widgets/job_card.dart';

class RecommendedJobsSection extends StatelessWidget {
  const RecommendedJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended Jobs',
            style: AfacadTextStyles.textStyle20W700Blue(
              context,
            ).copyWith(height: 1.50, letterSpacing: -0.38),
          ),
          SizedBox(height: screenSize.height * 0.01), // 1% of screen height
          SizedBox(
            height: screenSize.height * 0.25, // 25% of screen height
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: screenSize.width * .05),
                  child: const JobCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
