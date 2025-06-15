abstract class LearningPathStates {}

class LearningPathInitial extends LearningPathStates {}

class LearningPathLoading extends LearningPathStates {}

class LearningPathFailure extends LearningPathStates {
  final String errorMessage;
  LearningPathFailure({required this.errorMessage});
}

class LearningPathSuccess extends LearningPathStates {
  final Map<String, dynamic> learningPath;
  LearningPathSuccess({required this.learningPath});
}
