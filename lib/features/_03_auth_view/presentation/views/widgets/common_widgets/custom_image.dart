import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    this.imageBottomPadding = 58,
  });
  final String image;
  final double imageBottomPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48, bottom: imageBottomPadding),
      child: SvgPicture.asset(image, height: 350, width: 350),
    );
  }
}
