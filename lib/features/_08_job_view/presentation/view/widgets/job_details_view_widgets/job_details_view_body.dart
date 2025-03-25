import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/custom_flexible_widget.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_details_view_widgets/job_details_component_section.dart';

import 'job_details_goole_icon.dart';

class JobDetailsViewBody extends StatelessWidget {
  const JobDetailsViewBody({super.key, required this.jobDetailsCardModel});
  final JobViewCardModel jobDetailsCardModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kAppPrimaryWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48),
            topRight: Radius.circular(48),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(top: -32, child: JobDetailsGoogleIcon()),
              Positioned(
                top: 46,
                bottom: 0,
                right: 0,
                left: 0,
                child: CustomFlexibleWidget(
                  child: JobDetailsComponentSection(
                    jobDetailsCardModel: jobDetailsCardModel,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
