import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.profileProfileUserImage,
          fit: BoxFit.contain,
          height: screenWidth * .22,
          width: screenWidth * .22,
        ),
        Positioned(
          bottom: 0,
          right: screenWidth * .01,
          child: Container(
            padding: EdgeInsets.all(screenWidth * .01),
            decoration: const BoxDecoration(
              color: Color(0xffE6E8EE),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: screenWidth * .05,
              color: Color(0xff131314),
            ),
          ),
        ),
      ],
    );
  }
}
