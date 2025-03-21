import 'package:flutter/cupertino.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

class RecentJobCardTitleSection extends StatelessWidget {
  const RecentJobCardTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Content Marketing', style: AfacadTextStyles.textStyle20W600Black),
        Icon(CupertinoIcons.bookmark, size: 24, color: Color(0xff131314)),
      ],
    );
  }
}
