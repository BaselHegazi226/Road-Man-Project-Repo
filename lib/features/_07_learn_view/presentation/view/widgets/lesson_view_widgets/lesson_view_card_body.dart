import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../data/model/learn_path_lesson_view_card_model.dart';
import 'lesson_view_card_component_section.dart';

class LessonViewCardBody extends StatelessWidget {
  const LessonViewCardBody({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.lessonViewCardModel,
  });
  final double screenHeight;
  final double screenWidth;
  final LearnPathLessonViewCardModel lessonViewCardModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LessonViewCardComponentSection(
          screenHeight: screenHeight,
          lesson: lessonViewCardModel.lessonNumber,
          lessonTitle: lessonViewCardModel.title,
          lessonTime: lessonViewCardModel.estimatedDuration,
        ),
        Icon(
          lessonViewCardModel.isAvailable
              ? Icons.play_circle_fill_outlined
              : Icons.lock_outline,
          color:
              lessonViewCardModel.isAvailable
                  ? kAppPrimaryBlueColor
                  : kAppPrimaryBlackColor,
          size: screenWidth * .06,
        ),
      ],
    );
  }
}
