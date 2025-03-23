import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class RecentJobCardTitleSection extends StatefulWidget {
  final String title;
  const RecentJobCardTitleSection({super.key, required this.title});

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
            });
          },
          icon: Icon(
            iconFavouriteIsActive ? activeFavouriteIcon : unActiveFavouriteIcon,
            size: 24,
            color: iconFavouriteIsActive ? Colors.red : Color(0xff131314),
          ),
        ),
      ],
    );
  }
}
