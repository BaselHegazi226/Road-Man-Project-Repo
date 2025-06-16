import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_quiz_view_card_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_radio_button_circle.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_radio_button_text.dart';

class QuizViewCardRadioButton extends StatelessWidget {
  const QuizViewCardRadioButton({
    super.key,
    required this.answers,
    required this.selectedAnswer,
    required this.hasAnswered,
    required this.onAnswerSelected,
  });

  final List<QuizViewCardAnswer> answers;
  final String? selectedAnswer;
  final bool hasAnswered;
  final Function(String, bool) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      children:
          answers.map((answer) {
            final isSelected = selectedAnswer == answer.answerText;
            return GestureDetector(
              onTap:
                  hasAnswered
                      ? null
                      : () =>
                          onAnswerSelected(answer.answerText, answer.isCorrect),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .005),
                child: Row(
                  spacing: screenWidth * .03,
                  children: [
                    QuizViewCardRadioButtonCircle(
                      isSelected: isSelected,
                      size: screenWidth * .06,
                      selectedColor:
                          answer.isCorrect
                              ? kAppPrimaryCorrectColor
                              : kAppPrimaryWrongColor,
                      unselectedColor: kQuizViewSecondlyColor,
                    ),
                    Expanded(
                      child: QuizViewCardRadioButtonText(
                        answerText: answer.answerText,
                        isSelected: isSelected,
                        selectedColor:
                            answer.isCorrect
                                ? kAppPrimaryCorrectColor
                                : kAppPrimaryWrongColor,
                        unselectedColor: kAppPrimaryBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
