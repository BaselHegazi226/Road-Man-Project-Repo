import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_const.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
        physics: const BouncingScrollPhysics(),
        itemCount: QuizViewConst.quizViewCardModelList.length,
        itemBuilder: (context, index) {
          final list = QuizViewConst.quizViewCardModelList;
          return Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .02),
            child: QuizViewCard(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              quizViewCardModel: list[index],
            ),
          );
        },
      ),
    );
  }
}
