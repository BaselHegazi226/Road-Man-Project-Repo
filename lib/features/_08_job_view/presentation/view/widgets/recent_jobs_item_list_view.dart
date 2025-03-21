import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/recent_jobs_item.dart';

class RecentJobsItemListView extends StatelessWidget {
  const RecentJobsItemListView({super.key});
  static const List<String> textList = [
    'All',
    'Design',
    'Development',
    'Marketing & Content Creator',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: textList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: RecentJobsItem(text: textList[index]),
          );
        },
      ),
    );
  }
}
