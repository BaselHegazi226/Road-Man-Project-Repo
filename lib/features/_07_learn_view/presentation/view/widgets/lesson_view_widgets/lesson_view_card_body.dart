import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';

import '../../../../../../core/helper/const_variables.dart';
import 'lesson_view_card_component_section.dart';

class LessonViewCardBody extends StatelessWidget {
  const LessonViewCardBody({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.learnPathLessonModel,
    required this.onPressed,
  });
  final double screenHeight;
  final double screenWidth;
  final LearnPathLessonModel learnPathLessonModel;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LessonViewCardComponentSection(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          lessonNumber: learnPathLessonModel.lessonNumber,
          lessonTitle: learnPathLessonModel.title,
          lessonTime: learnPathLessonModel.estimatedDuration,
        ),
        Icon(
          true ? Icons.play_circle_fill_outlined : Icons.lock_outline,
          color: true ? kAppPrimaryBlueColor : kAppPrimaryBlackColor,
          size: screenWidth * .06,
        ),
      ],
    );
  }
}
