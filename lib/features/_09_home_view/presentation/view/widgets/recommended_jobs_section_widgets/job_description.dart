import 'package:flutter/material.dart';

class JobDescription extends StatelessWidget {
  final String description;
  const JobDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: const Color(0xFF131314),
        fontSize: 16,
        fontFamily: 'Afacad',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
