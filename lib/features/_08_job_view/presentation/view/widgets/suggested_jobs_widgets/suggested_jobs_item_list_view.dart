import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/data/model/suggested_jobs_item_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_item.dart';

class SuggestedJobsItemListView extends StatelessWidget {
  const SuggestedJobsItemListView({
    super.key,
    required this.suggestedJobsItemModelList,
  });
  final List<SuggestedJobsItemModel> suggestedJobsItemModelList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 182,
      child: Expanded(
        child: ListView.builder(
          itemCount: suggestedJobsItemModelList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SuggestedJobsItem(
                suggestedJobsItemModel: suggestedJobsItemModelList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
