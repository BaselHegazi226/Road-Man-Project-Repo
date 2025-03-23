import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_08_job_view/data/model/suggested_jobs_card_model.dart';

class SuggestedJobsTrackLocationSection extends StatefulWidget {
  const SuggestedJobsTrackLocationSection({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.suggestedJobsItemModel,
  });
  final String image;
  final String title, subTitle;
  final SuggestedJobsCardModel suggestedJobsItemModel;

  @override
  State<SuggestedJobsTrackLocationSection> createState() =>
      _SuggestedJobsTrackLocationSectionState();
}

class _SuggestedJobsTrackLocationSectionState
    extends State<SuggestedJobsTrackLocationSection> {
  IconData unActiveFavouriteIcon = CupertinoIcons.heart;
  IconData activeFavouriteIcon = CupertinoIcons.heart_fill;
  bool iconFavouriteIsActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            SvgPicture.asset(
              widget.suggestedJobsItemModel.trackLocationImage,
              width: 32,
              height: 32,
            ),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.suggestedJobsItemModel.trackLocationTitle,
                  style: AfacadTextStyles.textStyle16W500Black,
                ),
                Text(
                  widget.suggestedJobsItemModel.trackLocationSubtitle,
                  style: AfacadTextStyles.textStyle14W400Grey,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                setState(() {
                  iconFavouriteIsActive = !iconFavouriteIsActive;
                });
              },
              icon: Icon(
                iconFavouriteIsActive
                    ? activeFavouriteIcon
                    : unActiveFavouriteIcon,
                size: 24,
                color: iconFavouriteIsActive ? Colors.red : Color(0xff131314),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
