import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper/const_variables.dart';
import '../../../../../generated/assets.dart';

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
            const Column(
              children: [
                Text(
                  'Content Marketing',
                  style: TextStyle(
                    color: kTextPrimaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Google | Cairo | Egypt',
                  style: TextStyle(
                    color: Color(0xff8A8C90),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
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
