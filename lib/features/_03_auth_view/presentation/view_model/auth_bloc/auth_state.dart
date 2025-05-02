abstract class AuthStates {}

class AuthInitial extends AuthStates {}

//Sign Up States
class SignUpInitial extends AuthStates {}

class SignUpFailure extends AuthStates {
  final String errorMessage;
  SignUpFailure({required this.errorMessage});
}

class SignUpLoading extends AuthStates {}

class SignUpSuccess extends AuthStates {
  final String name;
  final String email;
  final String password;

  SignUpSuccess({
    required this.name,
    required this.email,
    required this.password,
  });
}

//Sign In States
class SignInInitial extends AuthStates {}

class SignInFailure extends AuthStates {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

class SignInLoading extends AuthStates {}

class SignInSuccess extends AuthStates {
  final String email;
  final String password;

  SignInSuccess({required this.email, required this.password});
}

//Forget Password States
class ForgetPasswordInitial extends AuthStates {}

class ForgetPasswordFailure extends AuthStates {
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}

class ForgetPasswordLoading extends AuthStates {}

class ForgetPasswordSuccess extends AuthStates {
  final String email;

  ForgetPasswordSuccess({required this.email});
}

//Reset Password States
class ResetPasswordInitial extends AuthStates {}

class ResetPasswordFailure extends AuthStates {
  final String errorMessage;
  ResetPasswordFailure({required this.errorMessage});
}

class ResetPasswordLoading extends AuthStates {}

class ResetPasswordSuccess extends AuthStates {
  final String email, otp, newPassword, confirmPassword;

  ResetPasswordSuccess({
    required this.email,
    required this.otp,
    required this.newPassword,
    required this.confirmPassword,
  });
}

//Verification After Forget Password States
class VerificationOtpInitial extends AuthStates {}

class VerificationOtpFailure extends AuthStates {
  final String errorMessage;
  VerificationOtpFailure({required this.errorMessage});
}

class VerificationOtpLoading extends AuthStates {}

class VerificationOtpSuccess extends AuthStates {
  final String email, otp;

  VerificationOtpSuccess({required this.email, required this.otp});
}

//Verification Email States
class VerificationEmailInitial extends AuthStates {}

class VerificationEmailFailure extends AuthStates {
  final String errorMessage;
  VerificationEmailFailure({required this.errorMessage});
}

class VerificationEmailLoading extends AuthStates {}

class VerificationEmailSuccess extends AuthStates {
  final String email, otp;

  VerificationEmailSuccess({required this.email, required this.otp});
}
