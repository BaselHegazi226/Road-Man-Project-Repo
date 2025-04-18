import 'package:flutter/material.dart';

import '../../../../../../core/utilities/base_text_styles.dart';

class LessonViewCardComponentSection extends StatelessWidget {
  const LessonViewCardComponentSection({
    super.key,
    required this.screenHeight,
    required this.lesson,
    required this.lessonTitle,
    required this.lessonTime,
  });
  final double screenHeight;
  final String lesson, lessonTitle, lessonTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: screenHeight * .005,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(lesson, style: JostTextStyles.textStyle15W600Black),
        SizedBox(height: screenHeight * .005),
        Text(lessonTitle, style: JostTextStyles.textStyle15W600Blue),
        Text(lessonTime, style: AfacadTextStyles.textStyle15W500Grey),
      ],
    );
  }
}
