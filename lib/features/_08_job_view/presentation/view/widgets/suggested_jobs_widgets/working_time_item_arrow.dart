import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/helper/const_variables.dart';

class WorkingTimeItemArrow extends StatelessWidget {
  const WorkingTimeItemArrow({super.key, required this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kAppPrimaryBlueColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          FontAwesomeIcons.arrowRight,
          color: kAppPrimaryWhiteColor,
          size: 24,
        ),
      ),
    );
  }
}
