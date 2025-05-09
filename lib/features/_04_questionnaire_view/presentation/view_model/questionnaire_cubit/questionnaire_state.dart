import '../../../data/model/question_model.dart';

abstract class QuestionnaireState {}

class QuestionnaireInitial extends QuestionnaireState {}

// Fetch Questions States
class FetchQuestionsLoading extends QuestionnaireState {}

class FetchQuestionsSuccess extends QuestionnaireState {
  final List<QuestionModel> questions;
  FetchQuestionsSuccess({required this.questions});
}

class FetchQuestionsFailure extends QuestionnaireState {
  final String errorMessage;
  FetchQuestionsFailure({required this.errorMessage});
}

// Fetch Question By Page Number States
class FetchQuestionByPageLoading extends QuestionnaireState {}

class FetchQuestionByPageSuccess extends QuestionnaireState {
  final QuestionModel question;
  FetchQuestionByPageSuccess({required this.question});
}

class FetchQuestionByPageFailure extends QuestionnaireState {
  final String errorMessage;
  FetchQuestionByPageFailure({required this.errorMessage});
}

// Submit Answer States
class SubmitAnswerLoading extends QuestionnaireState {}

class SubmitAnswerSuccess extends QuestionnaireState {
  final int nextPageNumber;
  SubmitAnswerSuccess({required this.nextPageNumber});
}

class SubmitAnswerFailure extends QuestionnaireState {
  final String errorMessage;
  SubmitAnswerFailure({required this.errorMessage});
}

// Submit Questionnaire States
class SubmitQuestionnaireLoading extends QuestionnaireState {}

class SubmitQuestionnaireSuccess extends QuestionnaireState {}

class SubmitQuestionnaireFailure extends QuestionnaireState {
  final String errorMessage;
  SubmitQuestionnaireFailure({required this.errorMessage});
}