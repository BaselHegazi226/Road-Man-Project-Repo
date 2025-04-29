import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_03_auth_view/data/model/sign_in_model.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo.dart';

import '../../../../generated/assets.dart';
import '../model/sign_up_model.dart';

class AuthRepoImplement implements AuthRepo {
  final Dio dio = Dio();
  final basicRequest = '';
  @override
  Future<Either<Failure, void>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final signUpPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/register';

    final signUpModel = SignUpModel(
      name: name,
      email: email,
      password: password,
      image: Assets.googleImage,
      dateTime: DateTime.now(),
    );
    //
    // print('name from implementation sign up : (${signUpModel.name})');
    // print('email from implementation sign up : (${signUpModel.email})');
    // print('password from implementation sign up : (${signUpModel.password})');
    // print('photo from implementation sign up : (${signUpModel.image})');
    // print('date time from implementation sign up : (${signUpModel.dateTime})');

    try {
      final response = await dio.post(signUpPath, data: signUpModel.toJson());
      if (response.statusCode == 200) {
        return right(null);
      } else {
        //print('status code : ${response.statusCode.toString()}');
        return left(ServerFailure(errorMessage: 'Unexpected error occurred.'));
      }
    } on DioException catch (dioException) {
      //print('dio exception : ${dioException.error.toString()}');
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      //print('error : ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  }) async {
    final signInPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/login';

    final signInModel = SignInModel(email: email, password: password);
    //
    // print('email from implementation sign up : (${signInModel.email})');
    // print('password from implementation sign up : (${signInModel.password})');

    try {
      final response = await dio.post(signInPath, data: signInModel.toJson());
      if (response.statusCode == 200) {
        return right(null);
      } else {
        //print('status code : ${response.statusCode.toString()}');
        return left(ServerFailure(errorMessage: 'Unexpected error occurred.'));
      }
    } on DioException catch (dioException) {
      //print('dio exception : ${dioException.error.toString()}');
      return left(ServerFailure(errorMessage: dioException.error.toString()));
    } catch (e) {
      //print('error : ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String otp,
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
