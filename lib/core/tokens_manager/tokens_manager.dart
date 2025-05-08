import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/_03_auth_view/data/model/user_token_model.dart'; // افترض أنه فيه حزمة تخزين آمن

class SecureStorageHelper {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveUserTokens(UserTokenModel userToken) async {
    await _storage.write(key: 'token', value: userToken.token);
    await _storage.write(key: 'refreshToken', value: userToken.refreshToken);
  }

  static Future<UserTokenModel?> getUserTokens() async {
    String? token = await _storage.read(key: 'token');
    String? refreshToken = await _storage.read(key: 'refreshToken');

    if (token != null && refreshToken != null) {
      return UserTokenModel(token: token, refreshToken: refreshToken);
    }
    return null;
  }

  static Future<void> clearTokens() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'refreshToken');
  }
}
