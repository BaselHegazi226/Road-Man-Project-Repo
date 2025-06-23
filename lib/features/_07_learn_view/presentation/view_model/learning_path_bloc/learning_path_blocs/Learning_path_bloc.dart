import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_cubit/learning_path_states.dart';

import 'Learning_path_events.dart';

class LearningPathBloc extends Bloc<LearningPathEvents, LearningPathStates> {
  final LearningPathRepo learningPathRepo;

  LearningPathBloc({required this.learningPathRepo})
    : super(LearningPathInitial()) {
    on<QuizCompletedEvent>(_onQuizCompletedEvent);
    on<LessonCompletedEvent>(_onLessonCompletedEvent);
  }

  Future<void> _onQuizCompletedEvent(
    QuizCompletedEvent event,
    Emitter<LearningPathStates> emit,
  ) async {
    emit(QuizCompletedLoading());
    final result = await learningPathRepo.quizCompleted(
      userToken: event.userToken,
      id: event.quizId,
      questionsAnswered: event.questionsAnswered,
    );
    await result.fold(
      (error) async {
        return emit(
          QuizCompletedFailure(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) async {
        return emit(QuizCompletedSuccess(finished: true));
      },
    );
  }

  Future<void> _onLessonCompletedEvent(
    LessonCompletedEvent event,
    Emitter<LearningPathStates> emit,
  ) async {
    emit(LessonCompletedLoading());
    final result = await learningPathRepo.lessonCompleted(
      userToken: event.userToken,
      id: event.lessonId,
    );
    await result.fold(
      (error) async {
        return emit(
          LessonCompletedFailure(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) async {
        return emit(LessonCompletedSuccess(lessonId: event.lessonId));
      },
    );
  }
}
