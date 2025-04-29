import 'package:dartz/dartz.dart';
import 'package:road_man_project/core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<Either<Failure, void>> forgetPassword({required String email});
  Future<Either<Failure, void>> resetPassword({
    required String otp,
    required String email,
    required String newPassword,
    required String confirmPassword,
  });
}
