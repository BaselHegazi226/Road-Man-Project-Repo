import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LearningPathStep extends StatelessWidget {
  final String image;
  final double iconSize;
  final Color iconColor, backgroundColor, shadowColor;
  final VoidCallback onPressed;

  const LearningPathStep({
    super.key,
    required this.image,
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
        height: 90, // ارتفاع الحاوية
        width: 100, // عرض الحاوية
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
        child: Center(
          // لتوسيط الصورة داخل الحاوية
          child: SvgPicture.asset(
            image,
            height: 50, // ارتفاع الصورة المصغرة
            fit: BoxFit.contain, // الحفاظ على نسبة الأبعاد
          ),
        ),
      ),
    );
  }
}
