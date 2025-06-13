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

  Future<void> submitAnswers({
    required int questionId,
    required int answerId,
  }) async {
    emit(SubmitAnswerLoading());
  }

  // For checkbox questions, we need to handle multiple answers
  Future<void> submitMultipleAnswers({
    required int questionId,
    required List<int> answerIds,
  }) async {
    emit(SubmitAnswerLoading());

    _addMultipleResponses(questionId, answerIds);

    if (!answerIds.isNotEmpty) {
      emit(SubmitAnswerFailure(
          errorMessage: 'No answers selected'));
    }
  }

  Future<void> submitQuestionnaire() async {
    emit(SubmitQuestionnaireLoading());
    final result = await questionnaireRepo.submitQuestionnaire(
      responses: userResponses,
      token: ''
    );

    result.fold(
          (failure) => emit(SubmitQuestionnaireFailure(
          errorMessage: failure.errorMessage ?? 'Failed to submit questionnaire')),
          (_) => emit(SubmitQuestionnaireSuccess()),
    );
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