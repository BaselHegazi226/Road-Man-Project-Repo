import 'package:hive/hive.dart';

class UserInfoStorageHelper {
  static const String _boxName = 'user_info';

  /// فتح صندوق Hive
  static Future<Box> _openBox() async {
    return await Hive.openBox(_boxName);
  }

  /// حفظ بيانات المستخدم
  static Future<void> saveUserInfo({
    required String name,
    required String email,
    required String photo,
    required int userId,
    required String dateOfBirth,
  }) async {
    final box = await _openBox();

    await box.put('user_id', userId);
    await box.put('user_name', name);
    await box.put('user_email', email);
    await box.put('user_photo', photo);
    await box.put('date_of_birth', dateOfBirth);
  }

  /// استرجاع بيانات المستخدم
  static Future<Map<String, dynamic>?> getUserInfo() async {
    final box = await _openBox();

    final userId = box.get('user_id');
    final name = box.get('user_name');
    final email = box.get('user_email');
    final photo = box.get('user_photo');
    final dateOfBirth = box.get('date_of_birth');

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

  /// حذف بيانات المستخدم
  static Future<void> clearUserInfo() async {
    final box = await _openBox();

    await box.delete('user_id');
    await box.delete('user_name');
    await box.delete('user_email');
    await box.delete('user_photo');
    await box.delete('date_of_birth');
  }
}
