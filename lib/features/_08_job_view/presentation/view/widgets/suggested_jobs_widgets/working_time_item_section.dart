import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/working_time_item_arrow.dart';

class WorkingTimeSection extends StatelessWidget {
  const WorkingTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 16,
          children: [
            WorkingTimeItem(title: 'Part_Time'),
            WorkingTimeItem(title: 'Advanced Level'),
          ],
        ),
        WorkingTimeItemArrow(),
      ],
    );
  }
}
