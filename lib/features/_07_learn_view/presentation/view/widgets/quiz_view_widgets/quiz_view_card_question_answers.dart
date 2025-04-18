import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/quiz_view_card_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/quiz_view_widgets/quiz_view_card_radio_button.dart';

class QuizViewCardQuestionAnswers extends StatelessWidget {
  const QuizViewCardQuestionAnswers({
    super.key,
    required this.question,
    required this.answers,
  });
  final String question;
  final List<QuizViewCardAnswer> answers;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: MediaQuery.sizeOf(context).height * .005,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: AfacadTextStyles.textStyle16W600Black.copyWith(
            height: 1.5,
            letterSpacing: -0.304,
          ),
        ),
        QuizViewCardRadioButton(answers: answers),
      ],
    );
  }
}
