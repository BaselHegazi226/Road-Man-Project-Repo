import 'package:flutter/material.dart';
import 'package:road_man_project/features/_08_job_view/data/model/job_view_card_model.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/suggested_jobs_widgets/suggested_jobs_card.dart';

class SuggestedJobsCardListView extends StatelessWidget {
  const SuggestedJobsCardListView({
    super.key,
    required this.suggestedJobsItemModelList,
  });
  final List<JobViewCardModel> suggestedJobsItemModelList;
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
              child: SuggestedJobsCard(
                suggestedJobsItemModel: suggestedJobsItemModelList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
