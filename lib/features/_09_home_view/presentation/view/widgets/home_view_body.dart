import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_home_view/presentation/view/widgets/progress_section.dart';
import 'package:road_man_project/features/_09_home_view/presentation/view/widgets/recommended_jobs_section.dart';
import 'package:road_man_project/features/_09_home_view/presentation/view/widgets/welcome_section.dart';

import 'current_path_card.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 64),
            const WelcomeSection(),
            const SizedBox(height: 24),
            const CurrentPathCard(),
            const SizedBox(height: 24),
            const ProgressSection(),
            const SizedBox(height: 24),
            const RecommendedJobsSection(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}