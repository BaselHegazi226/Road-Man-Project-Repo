import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../generated/assets.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Image.asset(
          Assets.profileProfileUserImage,
          fit: BoxFit.cover,
          height: 64,
          width: 64,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Ali',
                style: AfacadTextStyles.textStyle16W500Black.copyWith(),
              ),
              Text(
                'ahmed123@gmail.com',
                style: AfacadTextStyles.textStyle12W400Black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
