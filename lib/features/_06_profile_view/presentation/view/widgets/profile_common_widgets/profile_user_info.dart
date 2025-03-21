import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kTextBlackPrimaryColor,
                ),
              ),
              Text(
                'ahmed123@gmail.com',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kTextBlackPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
