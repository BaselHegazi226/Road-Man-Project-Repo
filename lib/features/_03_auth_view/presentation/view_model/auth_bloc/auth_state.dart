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

//Forget Password States
class ForgetPasswordInitial extends AuthState {}

class ForgetPasswordFailure extends AuthState {
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}

class ForgetPasswordLoading extends AuthState {}

class ForgetPasswordSuccess extends AuthState {
  final String email;

  ForgetPasswordSuccess({required this.email});
}

//Reset Password States
class ResetPasswordInitial extends AuthState {}

class ResetPasswordFailure extends AuthState {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}

class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {
  final String email, otp, newPassword, confirmPassword;

  ResetPasswordSuccess({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });
}

//Verification After Forget Password States
class VerificationOtpInitial extends AuthState {}

class VerificationOtpFailure extends AuthState {
  final String errorMessage;
  VerificationOtpFailure({required this.errorMessage});
}

class VerificationOtpLoading extends AuthState {}

class VerificationOtpSuccess extends AuthState {
  final String email, otp;

  VerificationOtpSuccess({required this.email, required this.otp});
}

//Verification Email States
class VerificationEmailInitial extends AuthState {}

class VerificationEmailFailure extends AuthState {
  final String errorMessage;
  VerificationEmailFailure({required this.errorMessage});
}

class VerificationEmailLoading extends AuthState {}

class VerificationEmailSuccess extends AuthState {
  final String email, otp;

  VerificationEmailSuccess({required this.email, required this.otp});
}
