// auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_03_auth_view/data/repos/auth_repo.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_event.dart';
import 'package:road_man_project/features/_03_auth_view/presentation/view_model/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    // Register event handlers here
    on<SignUpEvent>(_onSignUpEvent);
    on<SignInEvent>(_onSignInEvent);
  }

  Future<void> _onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      name: event.name,
      email: event.email,
      password: event.password,
    );
    result.fold(
      (error) {
        print('${error.errorMessage}');
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

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoading());
    var result = await authRepo.signIn(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (error) {
        print('${error.errorMessage}');
        return emit(
          SignUpFailure(errorMessage: error.errorMessage ?? 'bloc error'),
        );
      },
      (success) {
        return emit(
          SignInSuccess(email: event.email, password: event.password),
        );
      },
    );
  }
}
