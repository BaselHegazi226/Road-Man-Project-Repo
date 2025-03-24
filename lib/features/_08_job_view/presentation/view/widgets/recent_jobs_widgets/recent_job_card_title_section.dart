import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_08_job_view/presentation/view/widgets/common_widgets/job_view_const_list.dart';

import '../../../../data/model/job_view_card_model.dart';

class RecentJobCardTitleSection extends StatefulWidget {
  final String title;
  final JobViewCardModel recentJobsCardModel;
  const RecentJobCardTitleSection({
    super.key,
    required this.title,
    required this.recentJobsCardModel,
  });

  @override
  State<RecentJobCardTitleSection> createState() =>
      _RecentJobCardTitleSectionState();
}

class _RecentJobCardTitleSectionState extends State<RecentJobCardTitleSection> {
  IconData unActiveFavouriteIcon = CupertinoIcons.heart;
  IconData activeFavouriteIcon = CupertinoIcons.heart_fill;
  bool iconFavouriteIsActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title, style: AfacadTextStyles.textStyle20W600Black),
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            setState(() {
              iconFavouriteIsActive = !iconFavouriteIsActive;
              if (iconFavouriteIsActive) {
                JobViewConstList.favouriteCardList.add(
                  widget.recentJobsCardModel,
                );
              } else {
                JobViewConstList.favouriteCardList.remove(
                  widget.recentJobsCardModel,
                );
              }
            });
          },
          icon: Icon(
            iconFavouriteIsActive ? activeFavouriteIcon : unActiveFavouriteIcon,
            size: 24,
            color: kEditProfileIconColor,
          ),
        ),
      ],
    );
  }
}
