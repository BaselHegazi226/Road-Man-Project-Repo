import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/progress_items.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/start_learning_button.dart';

class LeftSection extends StatelessWidget {
  const LeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProgressItems(),
        const Spacer(),
        const StartLearningButton(),
      ],
    );
  }
}
