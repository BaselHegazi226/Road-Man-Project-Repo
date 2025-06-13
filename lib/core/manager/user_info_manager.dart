import 'package:hive/hive.dart';
import 'package:road_man_project/features/_09_profile_view/data/models/update_profile_model/user_info_model.dart';

class UserInfoStorageHelper {
  static const String _boxName = 'user_info';

  /// فتح صندوق Hive
  static Future<Box> _openBox() async {
    return await Hive.openBox(_boxName);
  }

  /// حفظ بيانات المستخدم باستخدام الموديل
  static Future<void> saveUserInfo(UserInfoModel user) async {
    final box = await _openBox();
    final data = user.toJson();

    for (final entry in data.entries) {
      await box.put(entry.key, entry.value);
    }
  }

  /// استرجاع بيانات المستخدم كموديل
  static Future<UserInfoModel?> getUserInfo() async {
    final box = await _openBox();

    final data = {
      'userID': box.get('userID'),
      'name': box.get('name'),
      'email': box.get('email'),
      'photo': box.get('photo'),
      'dateOfBirth': box.get('dateOfBirth'),
    };

    final allNotNull = data.values.every((value) => value != null);
    if (!allNotNull) return null;

    return UserInfoModel.fromJson(data);
  }

  /// حذف بيانات المستخدم
  static Future<void> clearUserInfo() async {
    final box = await _openBox();
    await box.deleteAll(['userID', 'name', 'email', 'photo', 'dateOfBirth']);
  }
}
