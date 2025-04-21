import 'package:flutter/material.dart';

class StartLearningButton extends StatelessWidget {
  const StartLearningButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: const Color(0xFF2352A1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        'Start learning',
        style: TextStyle(
          color: const Color(0xFFF8F9FB),
          fontSize: 14,
          fontFamily: 'Afacad',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}