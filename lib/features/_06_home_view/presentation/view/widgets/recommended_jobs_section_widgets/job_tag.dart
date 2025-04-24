import 'package:flutter/material.dart';

class JobTag extends StatelessWidget {
  final String tag;
  const JobTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: const Color(0xFFE6E8EE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: const Color(0xFF131314),
          fontSize: 11,
          fontFamily: 'Afacad',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
