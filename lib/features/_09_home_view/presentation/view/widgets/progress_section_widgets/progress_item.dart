import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgressItem extends StatelessWidget {
  final String title;
  final String value;
  final String image;

  const ProgressItem({
    super.key,
    required this.title,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            SvgPicture.asset(image, width: 24, height: 24),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF131314),
                fontSize: 14,
                fontFamily: 'Afacad',
                fontWeight: FontWeight.w600,
                height: 1.50,
                letterSpacing: -0.27,
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF131314),
            fontSize: 14,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w600,
            height: 1.50,
            letterSpacing: -0.27,
          ),
        ),
      ],
    );
  }
}