import 'package:flutter/material.dart';

import '../job_view_widgets/const_job_details_list_class.dart';
import 'job_details_user_job_details_item.dart';

class JobDetailsUserJobDetailsItemsSection extends StatelessWidget {
  const JobDetailsUserJobDetailsItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return JobDetailsUserJobDetailsItem(
          jobDetailsUserJobDetailsItemModel:
              ConstJobDetailsListClass
                  .jobDetailsUserJobDetailsItemModelList[index],
        );
      },
    );
  }
}
