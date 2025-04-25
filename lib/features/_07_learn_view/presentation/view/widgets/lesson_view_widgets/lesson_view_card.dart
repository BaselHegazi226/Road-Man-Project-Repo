import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/lesson_view_card_model.dart';

import 'lesson_view_card_body.dart';

class LessonViewCard extends StatelessWidget {
  const LessonViewCard({super.key, required this.lessonViewCardModel});
  final LessonViewCardModel lessonViewCardModel;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: screenWidth,
      height: screenHeight * .14,
      padding: EdgeInsets.all(screenWidth * .04),
      margin: EdgeInsets.only(bottom: screenHeight * .005),
      decoration: BoxDecoration(
        color: Color(0xffE6E8EE),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(screenWidth * .04),
          topLeft: Radius.circular(screenWidth * .04),
        ),
      ),
      child: LessonViewCardBody(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        lessonViewCardModel: lessonViewCardModel,
      ),
    );
  }
}
