import '../../../../../generated/assets.dart';

class UserInfoModel {
  final String userID, name, email, photo, dateOfBirth;

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
            : Assets.profileDefaultImage;

    return UserInfoModel(
      userID: json['userID'],
      email: json['email'],
      photo: resolvedPhoto,
      name: json['name'],
      dateOfBirth: json['birthDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'photo': photo,
      'name': name,
      'birthDate': dateOfBirth,
    };
  }
}
