class UserTokenModel {
  final String token, refreshToken;
  UserTokenModel({required this.token, required this.refreshToken});
  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"token": token, "refreshToken": refreshToken};
  }
}
