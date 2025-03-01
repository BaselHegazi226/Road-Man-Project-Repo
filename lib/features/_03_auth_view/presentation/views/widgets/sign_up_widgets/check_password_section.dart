import 'package:flutter/material.dart';

class CheckPasswordItem extends StatelessWidget {
  const CheckPasswordItem({
    super.key,
    required this.color,
    required this.text,
    required this.iconData,
  });
  final Color color;
  final String text;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(iconData, color: color),
        const SizedBox(width: 8),
        Text(
          maxLines: 1,
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
