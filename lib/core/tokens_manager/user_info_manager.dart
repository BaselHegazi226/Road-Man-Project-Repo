import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserInfoStorageHelper {
  static final _storage = FlutterSecureStorage();

  static Future<void> saveUserInfo({
    required String name,
    required String email,
    required String photo,
    required int userId,
    required String dateOfBirth,
  }) async {
    await _storage.write(key: 'user_id', value: '$userId');
    await _storage.write(key: 'user_name', value: name);
    await _storage.write(key: 'user_email', value: email);
    await _storage.write(key: 'user_photo', value: photo);
    await _storage.write(key: 'date_of_birth', value: dateOfBirth);
  }

  static Future<Map<String, String>?> getUserInfo() async {
    final userId = await _storage.read(key: 'user_id');
    final name = await _storage.read(key: 'user_name');
    final email = await _storage.read(key: 'user_email');
    final photo = await _storage.read(key: 'user_photo');
    final dateOfBirth = await _storage.read(key: 'date_of_birth');

    if (userId != null &&
        name != null &&
        email != null &&
        photo != null &&
        dateOfBirth != null) {
      return {
        'user_id': userId,
        'name': name,
        'email': email,
        'photo': photo,
        'date_of_birth': dateOfBirth,
      };
    }
    return null;
  }

  static Future<void> clearUserInfo() async {
    await _storage.delete(key: 'user_id');
    await _storage.delete(key: 'user_name');
    await _storage.delete(key: 'user_email');
    await _storage.delete(key: 'user_photo');
    await _storage.delete(key: 'date_of_birth');
  }
}
