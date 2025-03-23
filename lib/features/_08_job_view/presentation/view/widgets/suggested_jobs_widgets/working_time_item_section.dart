import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item_arrow.dart';

class WorkingTimeSection extends StatelessWidget {
  const WorkingTimeSection({
    super.key,
    required this.onPressed,
    required this.title1,
    required this.title2,
  });
  final VoidCallback? onPressed;
  final String title1, title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 16,
          children: [
            WorkingTimeItem(title: title1),
            WorkingTimeItem(title: title2),
          ],
        ),
        WorkingTimeItemArrow(onPressed: onPressed),
      ],
    );
  }
}
