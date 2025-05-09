// questionnaire_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_04_questionnaire_view/data/repos/questionnaire_repo.dart';
import 'package:road_man_project/features/_04_questionnaire_view/presentation/view_model/questionnaire_cubit/questionnaire_state.dart';

import '../../../data/model/questionnaire_response_model.dart';

class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  final QuestionnaireRepo questionnaireRepo;

  // To track user responses through the questionnaire
  final List<QuestionnaireResponseModel> userResponses = [];

  QuestionnaireCubit({required this.questionnaireRepo})
      : super(QuestionnaireInitial());

  Future<void> fetchAllQuestions() async {
    emit(FetchQuestionsLoading());
    final result = await questionnaireRepo.fetchAllQuestions();

    result.fold(
          (failure) => emit(FetchQuestionsFailure(
          errorMessage: failure.errorMessage ?? 'Failed to fetch questions')),
          (questions) => emit(FetchQuestionsSuccess(questions: questions)),
    );
  }

  Future<void> fetchQuestionByPageNumber(int pageNumber) async {
    emit(FetchQuestionByPageLoading());
    final result = await questionnaireRepo.fetchQuestionByPageNumber(
      pageNumber: pageNumber,
    );

    result.fold(
          (failure) => emit(FetchQuestionByPageFailure(
          errorMessage: failure.errorMessage ?? 'Failed to fetch question')),
          (question) => emit(FetchQuestionByPageSuccess(question: question)),
    );
  }

  Future<void> submitAnswer({
    required int questionId,
    required int answerId,
  }) async {
    emit(SubmitAnswerLoading());

    // Save the response
    _addResponse(questionId, answerId);

    final result = await questionnaireRepo.submitAnswer(
      questionId: questionId,
      answerId: answerId,
    );

    result.fold(
          (failure) => emit(SubmitAnswerFailure(
          errorMessage: failure.errorMessage ?? 'Failed to submit answer')),
          (nextPageNumber) => emit(SubmitAnswerSuccess(
          nextPageNumber: nextPageNumber)),
    );
  }

  // For checkbox questions, we need to handle multiple answers
  Future<void> submitMultipleAnswers({
    required int questionId,
    required List<int> answerIds,
  }) async {
    emit(SubmitAnswerLoading());

    // Save all responses
    _addMultipleResponses(questionId, answerIds);

    // For simplicity, we'll just use the first answer ID to get the next page
    // In a real implementation, you might need a different API endpoint for this
    if (answerIds.isNotEmpty) {
      final result = await questionnaireRepo.submitAnswer(
        questionId: questionId,
        answerId: answerIds.first,
      );

      result.fold(
            (failure) => emit(SubmitAnswerFailure(
            errorMessage: failure.errorMessage ?? 'Failed to submit answers')),
            (nextPageNumber) => emit(SubmitAnswerSuccess(
            nextPageNumber: nextPageNumber)),
      );
    } else {
      emit(SubmitAnswerFailure(
          errorMessage: 'No answers selected'));
    }
  }

  Future<void> submitQuestionnaire() async {
    emit(SubmitQuestionnaireLoading());
    final result = await questionnaireRepo.submitQuestionnaire(
      responses: userResponses,
    );

    result.fold(
          (failure) => emit(SubmitQuestionnaireFailure(
          errorMessage: failure.errorMessage ?? 'Failed to submit questionnaire')),
          (_) => emit(SubmitQuestionnaireSuccess()),
    );
  }

  // Helper method to add a single response
  void _addResponse(int questionId, int answerId) {
    final existingResponseIndex = userResponses.indexWhere(
          (response) => response.questionId == questionId,
    );

    if (existingResponseIndex != -1) {
      // For radio buttons and flow questions - replace the existing answer
      userResponses[existingResponseIndex] = QuestionnaireResponseModel(
        questionId: questionId,
        answerIds: [answerId],
      );
    } else {
      // Add new response
      userResponses.add(QuestionnaireResponseModel(
        questionId: questionId,
        answerIds: [answerId],
      ));
    }
  }

  // Helper method to add multiple responses (for checkbox questions)
  void _addMultipleResponses(int questionId, List<int> answerIds) {
    final existingResponseIndex = userResponses.indexWhere(
          (response) => response.questionId == questionId,
    );

    if (existingResponseIndex != -1) {
      // Replace existing answers
      userResponses[existingResponseIndex] = QuestionnaireResponseModel(
        questionId: questionId,
        answerIds: answerIds,
      );
    } else {
      // Add new response
      userResponses.add(QuestionnaireResponseModel(
        questionId: questionId,
        answerIds: answerIds,
      ));
    }
  }

  // Clear all responses (for reset or when starting a new questionnaire)
  void clearResponses() {
    userResponses.clear();
    emit(QuestionnaireInitial());
  }
}