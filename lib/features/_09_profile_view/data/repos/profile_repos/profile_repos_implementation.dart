import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:road_man_project/core/error/failure.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/change_password_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/update_profile_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos.dart';

import '../../../../../core/manager/tokens_manager.dart';

class ProfileReposImplementation extends ProfileRepos {
  final Dio dio = Dio();
  @override
  Future<Either<Failure, void>> updateProfile({
    required String name,
    required String photo,
    required String dateOfBirth,
  }) async {
    final String updateProfilePath =
        'http://met2025-001-site1.anytempurl.com/api/Accounts/update-profile';

    final userTokens = await SecureStorageHelper.getUserTokens();
    final String? userToken = userTokens?.token;

    String? base64Photo;

    // ✅ فقط لو الصورة موجودة نحاول تحويلها
    if (photo.trim().isNotEmpty) {
      if (photo.startsWith('/')) {
        try {
          final bytes = await File(photo).readAsBytes();
          base64Photo = base64Encode(bytes);
          print('length of photo from implem : ${base64Photo.length}');
          print('base64photo : $base64Photo');
        } catch (e) {
          return left(ServerFailure(errorMessage: 'Error reading image file'));
        }
      } else {
        base64Photo = photo; // مفترض أنها Base64 جاهزة
        print('length of photo from implem : ${base64Photo.length}');
        print('base64photo : $base64Photo');
      }
    }

    final updateProfileModel = UpdateProfileModel(
      photo: base64Photo, // يمكن أن تكون null لو مفيش صورة جديدة
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
        'http://met2025-001-site1.anytempurl.com/api/Accounts/change-password';
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
        'http://met2025-001-site1.anytempurl.com/api/Accounts/GetUserInfomation';

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
        'http://met2025-001-site1.anytempurl.com/api/Accounts/sign-out';

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
