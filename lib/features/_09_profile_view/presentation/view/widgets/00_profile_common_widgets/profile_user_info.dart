import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../generated/assets.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    super.key,
    required this.name,
    required this.email,
    required this.photo,
  });

  final String name, email, photo;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: screenWidth * .03,
        children: [
          Image.asset(
            Assets.profileProfileUserImage,
            fit: BoxFit.contain,
            height: screenWidth * .16,
            width: screenWidth * .16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AfacadTextStyles.textStyle16W500Black(context)),
              Text(
                email,
                style: AfacadTextStyles.textStyle12W400Black(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
