import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_description.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_user_job_details_items_section.dart';

import 'job_details_title_location_section.dart';

class JobDetailsComponentSection extends StatelessWidget {
  const JobDetailsComponentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        JobDetailsTitleLocationSection(),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.28,
          ),
          child: JobDetailsUserJobDetailsItemsSection(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: JobDetailsDescription(),
        ),
      ],
    );
  }
}
