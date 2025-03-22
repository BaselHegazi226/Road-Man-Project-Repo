import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../generated/assets.dart';

class JobDetailsGoogleIcon extends StatelessWidget {
  const JobDetailsGoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffF4F5F8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(40),
            blurRadius: 8, // درجة تشتت الظل
            offset: Offset(0, 4), // اتجاه الظل
          ),
        ],
      ),
      child: SvgPicture.asset(Assets.jobGoogleIcon, height: 42, width: 42),
    );
  }
}
