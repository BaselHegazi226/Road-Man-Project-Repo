// auth_event.dart
abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final DateTime dateTime;
  final String image;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.dateTime,
    required this.image,
  });
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}
