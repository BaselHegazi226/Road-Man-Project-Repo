class UpdateProfileModel {
  final String? name, photo, dateOfBirth;
  UpdateProfileModel({
    required this.photo,
    required this.name,
    required this.dateOfBirth,
  });
  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      photo: json['photo'],
      name: json['fullName'],
      dateOfBirth: json['birthDate'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'photo': photo, 'dateOfBirth': dateOfBirth};
  }
}
