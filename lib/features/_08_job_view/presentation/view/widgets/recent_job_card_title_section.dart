import 'package:flutter/cupertino.dart';

import '../../../../../core/helper/const_variables.dart';

class RecentJobCardTitleSection extends StatelessWidget {
  const RecentJobCardTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Content Marketing',
          style: TextStyle(
            color: kTextPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Icon(CupertinoIcons.bookmark, size: 24, color: Color(0xff131314)),
      ],
    );
  }
}
