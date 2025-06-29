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
  final String baseUrl = 'http://met2025-001-site1.anytempurl.com/api';
  @override
  Future<Either<Failure, void>> updateProfile({
    required String name,
    required String photo,
    required String dateOfBirth,
  }) async {
    final String updateProfilePath = '$baseUrl/Accounts/update-profile';

    final userTokens = await SecureStorageHelper.getUserTokens();
    final String? userToken = userTokens?.token;

    String? base64Photo;

    if (photo.trim().isNotEmpty) {
      if (photo.startsWith('/')) {
        final file = File(photo);

        // ✅ تحقق أن الملف موجود وغير فارغ
        if (!await file.exists()) {
          return left(ServerFailure(errorMessage: '⚠️ File does not exist.'));
        }

        final length = await file.length();
        if (length == 0) {
          return left(ServerFailure(errorMessage: '⚠️ Image file is empty.'));
        }

        try {
          final bytes = await file.readAsBytes();
          base64Photo = base64Encode(bytes);
          print('✅ [updateProfile] Encoded file length: ${base64Photo.length}');
        } catch (e) {
          return left(
            ServerFailure(errorMessage: '⚠️ Error reading image file.'),
          );
        }
      } else {
        base64Photo = photo;
        print('ℹ️ [updateProfile] Using provided base64 directly');
      }
    }

    final updateProfileModel = UpdateProfileModel(
      photo: base64Photo,
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
    String? userToken = userTokens?.token;

    final String changePasswordPath = '$baseUrl/Accounts/change-password';
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
    final String userInfoPath = '$baseUrl/Accounts/GetUserInfomation';

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
    final String signOutPath = '$baseUrl/Accounts/sign-out';

    try {
      final userTokens = await SecureStorageHelper.getUserTokens();

      if (userTokens == null || userTokens.token.isEmpty) {
        return left(ServerFailure(errorMessage: 'You are not signed in!'));
      }

      final response = await dio.post(
        signOutPath,
        options: Options(
          headers: {'Authorization': 'Bearer ${userTokens.token}'},
        ),
      );

      if (response.statusCode == 200) {
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
