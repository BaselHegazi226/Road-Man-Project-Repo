import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_model.dart';

abstract class LearningPathStates {}

// Initial
class LearningPathInitial extends LearningPathStates {}

// Generic Loading/Failure/Success
class LearningPathLoading extends LearningPathStates {}

class LearningPathFailure extends LearningPathStates {
  final String errorMessage;
  LearningPathFailure({required this.errorMessage});
}

class LearningPathSuccess extends LearningPathStates {
  final Map<String, dynamic> learningPath;
  LearningPathSuccess({required this.learningPath});
}

// Quiz Completed States
class QuizCompletedInitial extends LearningPathStates {}

class QuizCompletedFailure extends LearningPathStates {
  final String errorMessage;
  QuizCompletedFailure({required this.errorMessage});
}

class QuizCompletedLoading extends LearningPathStates {}

class QuizCompletedSuccess extends LearningPathStates {
  final bool finished;
  QuizCompletedSuccess({required this.finished});
}

// Lesson Completed States
class LessonCompletedInitial extends LearningPathStates {}

class LessonCompletedFailure extends LearningPathStates {
  final String errorMessage;
  LessonCompletedFailure({required this.errorMessage});
}

class LessonCompletedLoading extends LearningPathStates {}

class LessonCompletedSuccess extends LearningPathStates {}

// Save User Quiz Answer Local
class SaveUserQuizAnswerFailure extends LearningPathStates {
  final String errorMessage;
  SaveUserQuizAnswerFailure({required this.errorMessage});
}

class SaveUserQuizAnswerSuccess extends LearningPathStates {}

// Load User Quiz Answers Local
class LoadUserAnswersFromLocalFailure extends LearningPathStates {
  final String errorMessage;
  LoadUserAnswersFromLocalFailure({required this.errorMessage});
}

class LoadUserAnswersFromLocalSuccess extends LearningPathStates {
  final Map<int, Map<String, dynamic>> userAnswers;
  LoadUserAnswersFromLocalSuccess({required this.userAnswers});
}

//get Learning path local states

class LearningPathLocalFailure extends LearningPathStates {
  final String errorMessage;
  LearningPathLocalFailure({required this.errorMessage});
}

class LearningPathLocalSuccess extends LearningPathStates {
  final List<LearnPathModel> learningPath;
  LearningPathLocalSuccess({required this.learningPath});
}

// local data quiz states
class LocalDataQuizSuccess extends LearningPathStates {
  final Map<int, int> selectedAnswers;
  final int correctCount;
  final int incorrectCount;
  final bool isFinished;

  LocalDataQuizSuccess({
    required this.selectedAnswers,
    required this.correctCount,
    required this.incorrectCount,
    required this.isFinished,
  });
}

class LocalDataQuizFailure extends LearningPathStates {
  final String errorMessage;
  LocalDataQuizFailure({required this.errorMessage});
}
