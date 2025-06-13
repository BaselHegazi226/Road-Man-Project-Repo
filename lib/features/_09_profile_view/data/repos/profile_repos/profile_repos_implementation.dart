import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/core/tokens_manager/tokens_manager.dart';
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
    final userTokens = await SecureStorageHelper.getUserTokens();
    String? userToken;
    if (userTokens != null) {
      userToken = userTokens.token;
    }

    final updateProfileModel = UpdateProfileModel(
      photo: photo,
      name: name,
      dateOfBirth: dateOfBirth,
    );
    try {
      final response = await dio.put(
        updateProfilePath,
        data: updateProfileModel.toJson(),
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
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
    final userTokens = await SecureStorageHelper.getUserTokens();
    String? userToken;
    if (userTokens != null) {
      userToken = userTokens.token;
    }

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
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
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
  Future<Either<Failure, Map<String, dynamic>>> getUserInfo({
    required String userToken,
  }) async {
    final String userInfoPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/GetUserInfomation';

    try {
      final response = await dio.get(
        userInfoPath,
        options: Options(headers: {'Authorization': "Bearer $userToken"}),
      );

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

  @override
  Future<Either<Failure, void>> logOut() async {
    final String signOutPath =
        'http://hazemibrahim2319-001-site1.qtempurl.com/api/Accounts/sign-out';

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();

      if (userTokens == null || userTokens.token.isEmpty) {
        return left(ServerFailure(errorMessage: 'Yor are not sign in!'));
      }

      final response = await dio.post(
        signOutPath,
        options: Options(
          headers: {'Authorization': 'Bearer ${userTokens.token}'},
        ),
      );

      if (response.statusCode == 200) {
        // ✅ امسح التوكن بعد تسجيل الخروج الناجح
        await SecureStorageHelper.clearTokens();
        return right(null);
      } else {
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
}
