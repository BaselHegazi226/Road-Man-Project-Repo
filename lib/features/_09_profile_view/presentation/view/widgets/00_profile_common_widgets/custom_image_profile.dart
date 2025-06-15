import 'package:flutter/material.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({
    super.key,
    required this.image,
    required this.imageSize,
  });
  final Widget image;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: ClipOval(child: image),
    );
  }
}
