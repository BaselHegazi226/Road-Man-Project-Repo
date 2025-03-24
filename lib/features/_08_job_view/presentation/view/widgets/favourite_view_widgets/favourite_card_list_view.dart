import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/common_widgets/job_view_const_list.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/favourite_view_widgets/favourite_card.dart';

class FavouriteCardListView extends StatelessWidget {
  const FavouriteCardListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
      JobViewConstList.favouriteCardList.isEmpty
          ? Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            Text(
              'No Favourite',
              style: AfacadTextStyles.textStyle24W700Black,
            ),
            Icon(
              CupertinoIcons.heart_fill,
              size: 24,
              color: Colors.red,
            ),
            Text(
              'Items Yet!',
              style: AfacadTextStyles.textStyle24W700Black,
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: JobViewConstList.favouriteCardList.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: FavouriteCard(
              recentJobsCardItemModel:
              JobViewConstList.favouriteCardList.isEmpty
                  ? null
                  : JobViewConstList.favouriteCardList[index],
            ),
          );
        },
      ),
    );
  }
}
