import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../generated/assets.dart';

class TrackLocationSection extends StatelessWidget {
  const TrackLocationSection({super.key});

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
            SvgPicture.asset(Assets.jobGoogleIcon, width: 32, height: 32),
            Column(
              children: [
                Text(
                  'Content Marketing',
                  style: AfacadTextStyles.textStyle16W500Black,
                ),
                Text(
                  'Google | Cairo | Egypt',
                  style: AfacadTextStyles.textStyle14W400Grey,
                ),
              ],
            ),
          ],
        ),
        const Row(
          children: [
            Icon(CupertinoIcons.bookmark, size: 24, color: Color(0xff131314)),
          ],
        ),
      ],
    );
  }
}
