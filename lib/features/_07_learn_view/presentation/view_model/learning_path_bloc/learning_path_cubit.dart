import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view_model/learning_path_bloc/learning_path_states.dart';

class LearningPathCubit extends Cubit<LearningPathStates> {
  LearningPathRepo learningPathRepo;
  LearningPathCubit({required this.learningPathRepo})
    : super(LearningPathInitial());
  Future<Map<String, dynamic>> getLearningPathFun({
    required String userToken,
  }) async {
    Map<String, dynamic> data = {};
    emit(LearningPathLoading());

    final result = await learningPathRepo.getUserLearningPath(
      userToken: userToken,
    );
    await result.fold(
      (error) async {
        emit(
          LearningPathFailure(
            errorMessage: error.errorMessage ?? 'Unknown error',
          ),
        );
      },
      (success) async {
        data = success;
        emit(LearningPathSuccess(learningPath: success));
      },
    );
    return data;
  }
}
