import 'package:flutter/material.dart';
import 'package:road_man_project/features/_06_home_view/presentation/view/widgets/progress_section_widgets/progress_item.dart';

class ProgressItems extends StatelessWidget {
  const ProgressItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProgressItem(
          title: 'Completed Levels',
          value: '0/5',
          image: 'assets/images/home/metabolism.svg',
        ),
        const SizedBox(height: 4),
        ProgressItem(
          title: 'Completed Lessons',
          value: '0/10',
          image: 'assets/images/home/hourglass_arrow_down.svg',
        ),
        const SizedBox(height: 4),
        ProgressItem(
          title: 'Completed Tests',
          value: '0/5',
          image: 'assets/images/home/summarize.svg',
        ),
      ],
    );
  }
}
