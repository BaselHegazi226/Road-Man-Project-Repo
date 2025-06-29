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
      name: json['fullName'] ?? 'newUser', // ✅ خريطة من fullName إلى name
      dateOfBirth: json['birthDate']?.toString() ??
          DateTime.now().toIso8601String(), // ✅ birthDate → dateOfBirth
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

  UserInfoModel copyWith({
    int? userID,
    String? email,
    String? photo,
    String? name,
    String? dateOfBirth,
  }) {
    return UserInfoModel(
      userID: userID ?? this.userID,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}