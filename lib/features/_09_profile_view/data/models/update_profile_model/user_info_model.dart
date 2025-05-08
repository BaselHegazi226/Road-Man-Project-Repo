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
    return UserInfoModel(
      userID: json['userID'],
      email: json['email'],
      photo: json['photo'],
      name: json['fullName'],
      dateOfBirth: json['birthDate'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'email': email,
      'name': name,
      'photo': photo,
      'dateOfBirth': dateOfBirth,
    };
  }
}
