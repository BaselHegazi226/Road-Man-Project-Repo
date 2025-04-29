abstract class AuthState {}

class AuthInitial extends AuthState {}

//Sign Up States
class SignUpInitial extends AuthState {}

class SignUpFailure extends AuthState {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final String name;
  final String email;
  final String password;

  SignUpSuccess({
    required this.name,
    required this.email,
    required this.password,
  });
}

//Sign Ip States
class SignInInitial extends AuthState {}

class SignInFailure extends AuthState {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final String email;
  final String password;

  SignInSuccess({required this.email, required this.password});
}
