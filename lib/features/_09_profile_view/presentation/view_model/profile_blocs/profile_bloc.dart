import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_man_project/features/_09_profile_view/data/repos/profile_repos/profile_repos.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_event.dart';
import 'package:road_man_project/features/_09_profile_view/presentation/view_model/profile_blocs/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  final ProfileRepos profileRepos;
  ProfileBloc({required this.profileRepos}) : super(ProfileInitial()) {
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }

  Future<void> _onUpdateProfileEvent(
    UpdateProfileEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(UpdateProfileLoadingState());
    final result = await profileRepos.updateProfile(
      name: event.name,
      photo: event.photo,
      dateOfBirth: event.dateOfBirth,
    );
    result.fold(
      (error) {
        return emit(
          UpdateProfileFailureState(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) {
        return emit(UpdateProfileSuccessState());
      },
    );
  }

  Future<void> _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(ChangePasswordLoadingState());
    final result = await profileRepos.changePassword(
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
      confirmPassword: event.confirmPassword,
    );
    result.fold(
      (error) {
        return emit(
          ChangePasswordFailureState(
            errorMessage: error.errorMessage ?? 'UnKnown error',
          ),
        );
      },
      (success) {
        return emit(ChangePasswordSuccessState());
      },
    );
  }
}
