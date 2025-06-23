import 'dart:io';

import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import 'custom_image_profile.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    super.key,
    required this.email,
    required this.name,
    required this.photo,
  });

  final String email;
  final String name;
  final String photo;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    ImageProvider imageProvider;

    if (photo.startsWith('/data/')) {
      // 🟢 الصورة من الجهاز
      imageProvider = FileImage(File(photo));
    } else if (photo.startsWith('http')) {
      // 🌐 الصورة من السيرفر
      imageProvider = NetworkImage(photo);
    } else {
      // 🖼️ صورة افتراضية من الأصول
      imageProvider = AssetImage(photo);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageProfile(
            imageSize: screenWidth * .15,
            image: imageProvider,
          ),
          SizedBox(width: screenWidth * .03), // المسافة بين الصورة والنص
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
