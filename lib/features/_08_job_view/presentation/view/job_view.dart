import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_widgets/job_view_body.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
            child: jobViewAppbar(context),
          ),
          const Expanded(child: JobViewBody()),
        ],
      ),
    );
  }
}
