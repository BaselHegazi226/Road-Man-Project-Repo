import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/core/manager/user_learning_path_manager/user_learning_path_manager.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_response.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';

import '../model/learn_path_lesson_model.dart';
import '../model/learn_path_model.dart';
import '../model/learn_path_quiz_model.dart';
import '../model/learn_path_user_answer_model.dart';

class LearningPathRepoImpl implements LearningPathRepo {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserLearningPath({
    required String userToken,
  }) async {
    final String learningPathPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Recommendation/learning-path';
    try {
      final response = await dio.get(
        learningPathPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      print('Learning Path Data from impl = ${response.data.toString()}');

      if (response.statusCode == 200) {
        final learningPathResponse = LearningPathResponse.fromJson(
          response.data,
        );

        final List<LearnPathModel> paths = learningPathResponse.learningPath;

        // التخزين المحلي
        await getUserLearningPathLocal(paths: paths);

        // لو عايز ترجع البيانات الخام
        return right(response.data);
      } else {
        // ✅ هذا السطر كان ناقص
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode!,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LearnPathModel>>> getUserLearningPathLocal({
    required List<LearnPathModel> paths,
  }) async {
    try {
      // استخراج الدروس والاختبارات
      final allLessons = <LearnPathLessonModel>[];
      final allQuizzes = <LearnPathQuizModel>[];

      for (final path in paths) {
        allLessons.addAll(path.lessons);

        allQuizzes.add(path.quiz);
      }

      // التخزين المحلي
      await UserLearningPathHelper.saveLearningPaths(paths);
      await UserLearningPathHelper.saveLessons(allLessons);
      await UserLearningPathHelper.saveQuizzes(allQuizzes);

      // القراءة بعد التخزين
      final List<LearnPathModel> listOfPaths =
          UserLearningPathHelper.getAllLearningPaths();
      log('local data : $listOfPaths');
      log('local data length : ${listOfPaths.length}');
      return right(listOfPaths);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> quizCompleted({
    required String userToken,
    required int id,
    required int questionsAnswered,
  }) async {
    final String quizCompletedPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Recommendation/Quiz/$id/Complete?answeredCount=$questionsAnswered';
    try {
      final response = await dio.post(
        quizCompletedPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      log('Response Data: ${response.data}');
      log('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        log('dataaaaaaaaaaaaaaaaaaaaaaa : ${response.data}');
        return right(true);
      } else {
        print(
          '${ServerFailure.fromResponse(statusCode: response.statusCode, responseData: response.data)}',
        );
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      print('Dio Ex : ${dioException.message}');
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      print('errooooooooooooor : $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> lessonCompleted({
    required String userToken,
    required int id,
  }) async {
    final String lessonCompletedPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Recommendation/lessons/$id/complete';
    try {
      final response = await dio.post(
        lessonCompletedPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );
      print('Learning Path Data from impl = $response');

      if (response.statusCode == 200) {
        return right(true);
      } else {
        return left(
          ServerFailure.fromResponse(
            statusCode: response.statusCode,
            responseData: response.data,
          ),
        );
      }
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioException(dioException));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LearnPathUserAnswerModel>>>
  getLocalUserQuizAnswers(int quizId) async {
    try {
      final localAnswers = UserLearningPathHelper.getAllUserAnswers();
      final userAnswers =
          localAnswers.where((e) => e.quizId == quizId).toList();
      return right(userAnswers);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
