class QuizViewCardModel {
  final int questionId;
  final String questionText;
  final List<QuizViewCardAnswer> answers;

  const QuizViewCardModel({
    required this.questionId,
    required this.questionText,
    required this.answers,
  });
}

class QuizViewCardAnswer {
  final int answerId;
  final String answerText;

  const QuizViewCardAnswer({required this.answerId, required this.answerText});
}
