import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/const_variables.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: TextStyle(
                color: const Color(0xFF2352A1),
                fontSize: 24,
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w700,
                height: 1.5,
                letterSpacing: -0.46,
              ),
            ),
            Text(
              "Let's make progress today!",
              style: TextStyle(
                color: kAppPrimaryBlackColor,
                fontSize: 20,
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: -0.38,
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/images/home/notifications.svg',
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
