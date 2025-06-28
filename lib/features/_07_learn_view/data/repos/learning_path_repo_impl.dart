import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learning_path_response.dart';
import 'package:road_man_project/features/_07_learn_view/data/repos/learning_path_repo.dart';

class LearningPathRepoImpl implements LearningPathRepo {
  final Dio dio = Dio();
  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserLearningPath({
    required String userToken,
  }) async {
    final String learningPathPath =
        'http://met2025-001-site1.anytempurl.com/api/Recommendation/learning-path';
    try {
      final response = await dio.get(
        learningPathPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );

      if (response.statusCode == 200) {
        final learningPathResponse = LearningPathResponse.fromJson(
          response.data,
        );
        return right(learningPathResponse.toJson());
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
}
