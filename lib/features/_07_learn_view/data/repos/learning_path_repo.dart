import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class LearningPathRepo {
  Future<Either<Failure, Map<String, dynamic>>> getUserLearningPath({
    required String userToken,
  });
}
