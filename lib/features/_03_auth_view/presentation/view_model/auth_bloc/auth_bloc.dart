// auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    // Register event handlers here
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
    on<ForgetPasswordEvent>(_onForgetPasswordEvent);
    on<VerifyOtpEvent>(_onVerifyOtpEvent);
    on<VerifyEmailEvent>(_onVerifyEmailEvent);
    on<SendAgainVerifyEmailEvent>(_onSendAgainVerifyEmail);
    on<ResetPasswordEvent>(_onResetPasswordEvent);
  }
  //Sign up Event
  Future<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    result.fold(
      (error) {
        return emit(
          SignUpFailure(errorMessage: error.errorMessage ?? 'bloc error'),
        );
      },
      (success) {
        return emit(
          SignUpSuccess(
            name: event.name,
            email: event.email,
            password: event.password,
          ),
        );
      },
    );
  }

  //Sign in Event
  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (error) {
        return emit(
          SignInFailure(errorMessage: error.errorMessage ?? 'bloc error'),
        );
      },
      (success) {
        return emit(
          SignInSuccess(email: event.email, password: event.password),
        );
      },
    );
  }

  //Forget Password Event
  Future<void> _onForgetPasswordEvent(
    ForgetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.forgetPassword(email: event.email);
    result.fold(
      (error) {
        return emit(
          ForgetPasswordFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) {
        return emit(ForgetPasswordSuccess(email: event.email));
      },
    );
  }

  // Verify Otp Event
  Future<void> _onVerifyOtpEvent(
    VerifyOtpEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(VerificationOtpLoading());
    print('otp loading');
    var result = await authRepo.verificationOtp(
      email: event.email,
      otp: event.otp,
    );
    result.fold(
      (error) {
        print('otp error: ${error.errorMessage}');
        return emit(
          VerificationOtpFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) {
        return emit(VerificationOtpSuccess(email: event.email, otp: event.otp));
      },
    );
  }

  //VerifyEmail Event
  Future<void> _onVerifyEmailEvent(
    VerifyEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(VerificationEmailLoading());
    var result = await authRepo.verificationEmail(
      email: event.email,
      otp: event.otp,
    );
    result.fold(
      (error) {
        return emit(
          VerificationEmailFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) {
        return emit(
          VerificationEmailSuccess(email: event.email, otp: event.otp),
        );
      },
    );
  }

  //sendAgainVerifyEmail Event
  Future<void> _onSendAgainVerifyEmail(
    SendAgainVerifyEmailEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(SendAgainVerificationLoading());
    var result = await authRepo.sendAgainVerificationEmail(
      email: event.email,
      otp: event.otp,
    );
    result.fold(
      (error) {
        return emit(
          SendAgainVerificationFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) {
        return emit(
          SendAgainVerificationSuccess(email: event.email, otp: event.otp),
        );
      },
    );
  }

  //ResetPassword Event
  Future<void> _onResetPasswordEvent(
    ResetPasswordEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(
      otp: event.otp,
      email: event.email,
      newPassword: event.newPassword,
      confirmPassword: event.confirmPassword,
    );
    result.fold(
      (error) {
        return emit(
          ResetPasswordFailure(
            errorMessage: error.errorMessage ?? 'bloc error',
          ),
        );
      },
      (success) {
        return emit(
          ResetPasswordSuccess(
            email: event.email,
            otp: event.otp,
            newPassword: event.newPassword,
            confirmPassword: event.confirmPassword,
          ),
        );
      },
    );
  }
}
