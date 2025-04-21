import 'package:flutter/material.dart';
import 'package:road_man_project/features/_09_home_view/presentation/view/widgets/progress_section_widgets/left_section.dart';
import 'package:road_man_project/features/_09_home_view/presentation/view/widgets/progress_section_widgets/progress_circle.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F9FB),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF2352A1)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left section with progress stats and button
            Expanded(child: LeftSection()),

            // Right section with progress circle
            const ProgressCircle(),
          ],
        ),
      ),
    );
  }
}
