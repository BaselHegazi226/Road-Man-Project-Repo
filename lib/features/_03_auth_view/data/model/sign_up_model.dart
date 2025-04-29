class SignUpModel {
  final String name;
  final String email;
  final String password;
  final DateTime dateTime;
  final String image;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.dateTime,
    required this.image,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      dateTime: DateTime.parse(json['dateOfBirth'] as String),
      image: json['photo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    // إرسال التاريخ بالصيفة ISO 8601 (مثال: "2025-04-28T15:28:36.101Z")
    final String isoDateString = dateTime.toUtc().toIso8601String();
    print('name: $name');
    print('email: $email');
    print('password: $password');
    print('datetime: $isoDateString'); // طباعة التاريخ للتأكد من الصيغة
    print('image: $image');
    return {
      'name': name,
      'email': email,
      'password': password,
      'dateOfBirth': isoDateString, // إضافة التاريخ بالصيفة ISO 8601
      'photo': image,
    };
  }
}
