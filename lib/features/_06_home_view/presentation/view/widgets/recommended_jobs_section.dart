import 'package:flutter/material.dart';

import 'recommended_jobs_section_widgets/job_card.dart';

class RecommendedJobsSection extends StatelessWidget {
  const RecommendedJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Jobs',
          style: TextStyle(
            color: const Color(0xFF2352A1),
            fontSize: 20,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w700,
            height: 1.50,
            letterSpacing: -0.38,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              JobCard(),
              SizedBox(width: 12),
              JobCard(),
              SizedBox(width: 12),
              JobCard(),
            ],
          ),
        ),
      ],
    );
  }
}