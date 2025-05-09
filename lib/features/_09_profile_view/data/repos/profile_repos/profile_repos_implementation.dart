import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/change_password_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/update_profile_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos.dart';

class ProfileReposImplementation extends ProfileRepos {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, void>> updateProfile({
    required String name,
    required String photo,
    required String dateOfBirth,
  }) async {
    final String updateProfilePath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/update-profile';
    final updateProfileModel = UpdateProfileModel(
      photo: photo,
      name: name,
      dateOfBirth: dateOfBirth,
    );
    try {
      final response = await dio.put(
        updateProfilePath,
        data: updateProfileModel.toJson(),
      );
      if (response.statusCode == 200) {
        return right(null);
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
  Future<Either<Failure, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final String changePasswordPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/change-password';
    final changePasswordModel = ChangePasswordModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    try {
      final response = await dio.post(
        changePasswordPath,
        data: changePasswordModel.toJson(),
      );
      if (response.statusCode == 200) {
        return right(null);
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
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo() async {
    final String userInfoPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/GetUserInfomation';
    try {
      final response = await dio.get(userInfoPath);

      if (response.statusCode == 200) {
        final userInfoModel = UserInfoModel.fromJson(response.data);
        return right(userInfoModel.toJson());
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
