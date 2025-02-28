import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthImageSection extends StatelessWidget {
  const AuthImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SvgPicture.asset(image, width: 170, height: 184)],
      ),
    );
  }
}
