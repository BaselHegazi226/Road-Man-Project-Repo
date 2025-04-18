import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/quiz_view_card_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_radio_button_circle.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_radio_button_text.dart';

class QuizViewCardRadioButton extends StatefulWidget {
  const QuizViewCardRadioButton({super.key, required this.answers});
  final List<QuizViewCardAnswer> answers;

  @override
  State<QuizViewCardRadioButton> createState() =>
      _QuizViewCardRadioButtonState();
}

class _QuizViewCardRadioButtonState extends State<QuizViewCardRadioButton> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      children:
          widget.answers.map((answer) {
            final isSelected = selected == answer.answerText;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = answer.answerText;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * .005),
                child: Row(
                  spacing: screenWidth * .03,
                  children: [
                    QuizViewCardRadioButtonCircle(
                      isSelected: isSelected,
                      size: screenWidth * .06,
                      selectedColor: kAppPrimaryBlueColor,
                      unselectedColor: kQuizViewSecondlyColor,
                    ),
                    // استخدام Expanded هنا للسماح للنص بالنزول لسطر آخر
                    Expanded(
                      child: QuizViewCardRadioButtonText(
                        answerText: answer.answerText,
                        isSelected: isSelected,
                        selectedColor: kAppPrimaryBlueColor,
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
