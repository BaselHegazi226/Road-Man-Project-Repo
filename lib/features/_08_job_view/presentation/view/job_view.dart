import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_body.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5F8),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xffF4F5F8),
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: const Icon(
            Icons.menu_outlined,
            color: kTextPrimaryColor,
            size: 24,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            icon: const Icon(
              Icons.notifications_outlined,
              color: kTextPrimaryColor,
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const JobViewBody(),
    );
  }
}
