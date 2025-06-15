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
    Widget imageWidget;

    if (photo.startsWith('/data/')) {
      // 🟢 الصورة من الجهاز
      imageWidget = CustomImageProfile(
        imageSize: screenWidth * .15,
        image: Image.file(File(photo), fit: BoxFit.cover),
      );
    } else if (photo.startsWith('http')) {
      // 🌐 الصورة من السيرفر
      imageWidget = CustomImageProfile(
        imageSize: screenWidth * .15,
        image: Image.network(photo, fit: BoxFit.cover),
      );
    } else {
      // 🖼️ صورة افتراضية من الأصول
      imageWidget = CustomImageProfile(
        imageSize: screenWidth * .15,
        image: Image.asset(photo, fit: BoxFit.cover),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .04),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: screenWidth * .03,
        children: [
          imageWidget,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: screenHeight * .0025,
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
