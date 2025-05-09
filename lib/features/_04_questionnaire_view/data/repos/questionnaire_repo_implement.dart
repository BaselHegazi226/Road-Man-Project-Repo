// questionnaire_repo_implement.dart
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_04_questionnaire_view/data/repos/questionnaire_repo.dart';

import '../model/question_model.dart';
import '../model/questionnaire_response_model.dart';

class QuestionnaireRepoImplement implements QuestionnaireRepo {
  final Dio dio = Dio();
  final String baseUrl = 'http://hazemibrahim2319-001-site1.qtempurl.com/api';

  @override
  Future<Either<Failure, List<QuestionModel>>> fetchAllQuestions() async {
    final String path = '$baseUrl/Questionnaire';

    try {
      final response = await dio.get(path);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final questions = data
            .map((questionJson) => QuestionModel.fromJson(questionJson))
            .toList();
        return right(questions);
      } else {
        return left(ServerFailure(errorMessage: 'Failed to fetch questions.'));
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, QuestionModel>> fetchQuestionByPageNumber({
    required int pageNumber,
  }) async {
    final String path = '$baseUrl/Questionnaire';
    final Map<String, dynamic> queryParams = {'pageNumber': pageNumber};
    try {
      final response = await dio.get(path, queryParameters: queryParams);

      if (response.statusCode == 200) {
        final questionJson = response.data;
        print('fetchQuestionByPageNumber $questionJson');
        final question = QuestionModel.fromJson(questionJson);
        return right(question);
      } else {
        return left(ServerFailure(
            errorMessage: 'Failed to fetch question for page $pageNumber.'));
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> submitAnswer({
    required int questionId,
    required int answerId,
  }) async {
    final String path = '$baseUrl/Questionnaire/submit-answer';

    try {
      final response = await dio.post(path, data: {
        'questionId': questionId,
        'answerId': answerId,
      });

      if (response.statusCode == 200) {
        // Assuming the API returns the next page number
        final int nextPageNumber = response.data['nextPageNumber'];
        return right(nextPageNumber);
      } else {
        return left(ServerFailure(errorMessage: 'Failed to submit answer.'));
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> submitQuestionnaire({
    required List<QuestionnaireResponseModel> responses,
  }) async {
    final String path = '$baseUrl/Questionnaire/submit';

    try {
      final response = await dio.post(
        path,
        data: responses.map((r) => r.toJson()).toList(),
      );

      if (response.statusCode == 200) {
        return right(null);
      } else {
        return left(ServerFailure(
            errorMessage: 'Failed to submit questionnaire.'));
      }
    } on DioException catch (dioException) {
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}