import 'package:flutter/material.dart';
import 'package:road_man_project/features/_04_questionnaire/presentation/widgets/option_button.dart';

import 'gradient_progress_bar.dart';

class QuestionnaireViewBody extends StatelessWidget {
  const QuestionnaireViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Lets Start..',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Progress bar
            GradientProgressBar(progress: 1, horizontalPadding: 20),
            const SizedBox(height: 40),
            // Question
            const Center(
              child: Text(
                'What is your purpose for using the application?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 24),
            // Options
            OptionButton(
              text: 'Learn a new skill',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            OptionButton(
              text: 'Explore a suitable job',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
