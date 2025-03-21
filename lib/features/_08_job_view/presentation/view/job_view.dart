import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/general_widgets/job_view_app_bar.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/general_widgets/job_view_body.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      resizeToAvoidBottomInset: true,
      appBar: jobViewAppbar(),
      body: const JobViewBody(),
    );
  }
}
