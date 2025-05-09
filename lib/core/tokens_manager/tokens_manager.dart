import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/_03_auth_view/data/model/user_token_model.dart';

class SecureStorageHelper {
  static final _storage = FlutterSecureStorage();

  // تخزين التوكنات مع تاريخ انتهاء الصلاحية
  static Future<void> saveUserTokens(UserTokenModel userToken) async {
    await _storage.write(key: 'token', value: userToken.token);
    await _storage.write(key: 'refreshToken', value: userToken.refreshToken);

    // تخزين تاريخ انتهاء صلاحية التوكن
    final expirationDate = DateTime.now().add(
      Duration(hours: 23, minutes: 30),
    ); // التوكن ينتهي بعد 23 ساعة و 30 دقيقة
    await _storage.write(
      key: 'tokenExpiration',
      value: expirationDate.toIso8601String(),
    );

    // تخزين تاريخ انتهاء صلاحية الـ refresh token
    final refreshTokenExpiration = DateTime.now().add(
      Duration(days: 13, hours: 23, minutes: 30),
    ); // الـ refresh token ينتهي بعد 13 يوم و 23 ساعة و 30 دقيقة
    await _storage.write(
      key: 'refreshTokenExpiration',
      value: refreshTokenExpiration.toIso8601String(),
    );
  }

  // الحصول على التوكنات من الـ SecureStorage
  static Future<UserTokenModel?> getUserTokens() async {
    String? token = await _storage.read(key: 'token');
    String? refreshToken = await _storage.read(key: 'refreshToken');
    String? tokenExpiration = await _storage.read(key: 'tokenExpiration');
    String? refreshTokenExpiration = await _storage.read(
      key: 'refreshTokenExpiration',
    );

    if (token != null &&
        refreshToken != null &&
        tokenExpiration != null &&
        refreshTokenExpiration != null) {
      final expirationDate = DateTime.parse(tokenExpiration);
      final refreshExpirationDate = DateTime.parse(refreshTokenExpiration);

      // التحقق إذا كانت التوكنات قد انتهت
      if (DateTime.now().isAfter(expirationDate)) {
        // التوكن انتهت صلاحيتها
        return null;
      } else {
        // التوكن مازالت صالحة
        return UserTokenModel(token: token, refreshToken: refreshToken);
      }
    }
    return null; // في حاله عدم وجود التوكنات
  }

  // هذه الدالة لإرجاع تاريخ انتهاء صلاحية التوكن
  static Future<DateTime> getUserTokenExpiration() async {
    String? expiration = await _storage.read(key: 'tokenExpiration');
    if (expiration != null) {
      return DateTime.parse(expiration);
    }
    throw Exception("Token expiration not found");
  }

  static Future<void> clearTokens() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'refreshToken');
    await _storage.delete(key: 'tokenExpiration');
    await _storage.delete(key: 'refreshTokenExpiration');
  }
}
