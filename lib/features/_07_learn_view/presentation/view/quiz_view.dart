import 'package:flutter/material.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_app_bar.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_body.dart';

import '../../../../core/helper/const_variables.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int correctCount = 0;
  int incorrectCount = 0;
  final Map<int, String?> selectedAnswers = {};
  final Map<int, bool> hasAnsweredMap = {};

  void _updateAnswer(int questionId, String answerText, bool isCorrect) {
    setState(() {
      selectedAnswers[questionId] = answerText;
      hasAnsweredMap[questionId] = true;

      if (isCorrect) {
        correctCount++;
      } else {
        incorrectCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryWhiteColor,
      appBar: QuizViewAppBar(
        correctCount: correctCount,
        incorrectCount: incorrectCount,
      ),
      body: QuizViewBody(
        selectedAnswers: selectedAnswers,
        hasAnsweredMap: hasAnsweredMap,
        onAnswerSelected: _updateAnswer,
      ),
    );
  }
}
