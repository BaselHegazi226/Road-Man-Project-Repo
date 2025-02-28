import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';

class RememberMeCard extends StatelessWidget {
  const RememberMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kSecondlyDarkWhiteColor, width: 4),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            Icons.check_box_outline_blank_rounded,
            color: Colors.transparent,
            size: 28,
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
