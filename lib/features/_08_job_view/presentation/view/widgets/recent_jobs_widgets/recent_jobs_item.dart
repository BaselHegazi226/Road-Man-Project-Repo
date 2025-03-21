import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../core/helper/const_variables.dart';

class RecentJobsItem extends StatefulWidget {
  const RecentJobsItem({super.key, required this.text});
  final String text;
  @override
  State<RecentJobsItem> createState() => _RecentJobsItemState();
}

class _RecentJobsItemState extends State<RecentJobsItem> {
  Color backgroundColor = Color(0xffE6E8EE);
  Color textColor = kTextBlackPrimaryColor;
  bool isActiveButton = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: !isActiveButton ? backgroundColor : kAppPrimaryBlueColor,
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isActiveButton = !isActiveButton;
          });
        },
        child: Text(
          widget.text,
          style: AfacadTextStyles.textStyle16W600Black.copyWith(
            color:
                !isActiveButton
                    ? kTextBlackPrimaryColor
                    : kAppPrimaryWhiteColor,
          ),
        ),
      ),
    );
  }
}
