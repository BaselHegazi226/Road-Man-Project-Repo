import 'package:flutter/cupertino.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/job_view_search_bar_section.dart';

import 'job_view_item.dart';

class JobViewBody extends StatelessWidget {
  const JobViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 24,
        children: [JobViewSearchBarSection(), JobViewItem()],
      ),
    );
  }
}
