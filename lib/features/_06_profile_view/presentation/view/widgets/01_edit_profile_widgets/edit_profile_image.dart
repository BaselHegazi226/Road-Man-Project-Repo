import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(
          Assets.profileProfileUserImage,
          fit: BoxFit.cover,
          height: 88,
          width: 88,
        ),
        ClipRect(
          clipBehavior: Clip.none,
          child: Positioned(
            bottom: 8,
            right: 4,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xffE6E8EE),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 20,
                color: Color(0xff131314),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
