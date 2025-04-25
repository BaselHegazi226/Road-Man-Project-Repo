import 'package:flutter/material.dart';

class LearningPathStep extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Color iconColor, backgroundColor, shadowColor;
  final VoidCallback onPressed;

  const LearningPathStep({
    super.key,
    required this.iconData,
    this.iconSize = 48,
    required this.backgroundColor,
    required this.shadowColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Container(
        height: 100,
        width: 90,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Icon(iconData, size: iconSize, color: iconColor),
      ),
    );
  }
}
