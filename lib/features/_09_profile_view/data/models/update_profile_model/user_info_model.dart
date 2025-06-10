import '../../../../../generated/assets.dart';

class UserInfoModel {
  final String? name, email, photo, dateOfBirth;
  final int? userID;

  UserInfoModel({
    required this.userID,
    required this.email,
    required this.photo,
    required this.name,
    required this.dateOfBirth,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    final String rawPhoto = json['photo']?.toString() ?? '';

    // الصيغ المسموحة
    final allowedExtensions = ['.png', '.jpg', '.jpeg', '.svg'];

    final bool hasAllowedExtension = allowedExtensions.any(
      (ext) => rawPhoto.toLowerCase().endsWith(ext),
    );

    final String resolvedPhoto =
        rawPhoto.isNotEmpty && hasAllowedExtension
            ? rawPhoto
            : Assets.profileProfileUserImage;

    return UserInfoModel(
      userID: json['userID'] ?? 0,
      email: json['email'] ?? 'user@gmail.com',
      photo: resolvedPhoto,
      name: json['name'] ?? 'newUser',
      dateOfBirth:
          json['dateOfBirth']?.toString() ?? DateTime.now().toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'photo': photo,
      'name': name,
      'dateOfBirth': dateOfBirth,
    };
  }
}
