import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_description.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_user_job_details_items_section.dart';

import 'job_details_title_location_section.dart';

class JobDetailsComponentSection extends StatelessWidget {
  const JobDetailsComponentSection({
    super.key,
    required this.jobDetailsCardModel,
  });
  final JobViewCardModel jobDetailsCardModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        JobDetailsTitleLocationSection(
          title: jobDetailsCardModel.title,
          company: '${jobDetailsCardModel.company}|',
          location: jobDetailsCardModel.location,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.28,
          ),
          child: JobDetailsUserJobDetailsItemsSection(
            jobViewCardModel: jobDetailsCardModel,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: JobDetailsDescription(),
        ),
      ],
    );
  }
}
