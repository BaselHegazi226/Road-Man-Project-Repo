import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/lesson_view_widgets/lesson_view_card.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/lesson_view_widgets/lesson_view_const.dart';

class LessonViewBody extends StatelessWidget {
  const LessonViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: LessonViewConst.lessonViewCardModelList.length,
        itemBuilder: (context, index) {
          final list = LessonViewConst.lessonViewCardModelList;
          return LessonViewCard(lessonViewCardModel: list[index]);
        },
      ),
    );
  }
}
