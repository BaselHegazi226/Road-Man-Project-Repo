import 'package:dartz/dartz.dart';
import 'package:road_man_project/core/error/failure.dart';

abstract class ProfileRepos {
  Future<Either<Failure, void>> updateProfile({
    required String name,
    required String photo,
    required String dateOfBirth,
  });
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo({
    required String userToken,
  });
  Future<Either<Failure, void>> logOut();
}
