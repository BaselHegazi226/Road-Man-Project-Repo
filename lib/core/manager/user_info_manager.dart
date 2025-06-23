import 'dart:io';

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

    // ✅ فلترة الصورة لو كانت فارغة أو المسار غير صالح
    final photo = data['photo'];
    if (photo != null) {
      if (photo.toString().startsWith('/data/')) {
        final file = File(photo);
        if (!file.existsSync()) {
          print('🧨 [saveUserInfo] الصورة المحلية غير موجودة → تم تجاهلها');
          data.remove('photo');
        } else if (file.lengthSync() == 0) {
          print('🧨 [saveUserInfo] الصورة المحلية فارغة (0 bytes) → تم حذفها');
          data.remove('photo');
          await file.delete(); // اختياري
        }
      } else if (photo.toString().trim().isEmpty) {
        print('🧨 [saveUserInfo] الصورة base64 فاضية → تم تجاهلها');
        data.remove('photo');
      }
    }

    for (final entry in data.entries) {
      await box.put(entry.key, entry.value);
    }

    print('✅ [saveUserInfo] تم حفظ بيانات المستخدم: ${data.toString()}');
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

    final photoPath = data['photo'];
    if (photoPath != null && photoPath.toString().startsWith('/data/')) {
      final file = File(photoPath);
      if (!file.existsSync()) {
        print('⚠️ [getUserInfo] الصورة المحفوظة مش موجودة → حذفها عند التحميل');
        data['photo'] = '';
      } else if (file.lengthSync() == 0) {
        print('⚠️ [getUserInfo] الصورة المحفوظة حجمها 0 → حذفها عند التحميل');
        await file.delete();
        data['photo'] = '';
      }
    }

    final allNotNull = data.values.every((value) => value != null);
    if (!allNotNull) {
      print('❌ [getUserInfo] بيانات ناقصة → null');
      return null;
    }

    print('✅ [getUserInfo] تم استرجاع بيانات المستخدم: ${data.toString()}');
    return UserInfoModel.fromJson(data);
  }

  /// حذف بيانات المستخدم
  static Future<void> clearUserInfo() async {
    final box = await _openBox();
    await box.deleteAll(['userID', 'name', 'email', 'photo', 'dateOfBirth']);
    print('🧹 [clearUserInfo] تم حذف بيانات المستخدم من Hive');
  }
}
