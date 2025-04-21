import 'package:flutter/material.dart';

import 'half_circle_clipper.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background circle
        Container(
          width: 102,
          height: 100,
          decoration: const ShapeDecoration(
            color: Color(0xFFE6E8EE),
            shape: OvalBorder(),
          ),
        ),

        // Progress circle (partially visible - 50%)
        Container(
          width: 102,
          height: 100,
          decoration: const ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, 1.00),
              end: Alignment(0.50, 0.00),
              colors: [Color(0xFF052C6E), Color(0xFF3D76D5)],
            ),
            shape: OvalBorder(),
          ),
          child: ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(color: Colors.transparent),
          ),
        ),

        // Percentage text
        Text(
          '50%',
          style: TextStyle(
            color: const Color(0xFF052C6E),
            fontSize: 20,
            fontFamily: 'Afacad',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}