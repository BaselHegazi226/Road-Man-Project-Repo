abstract class ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String name, photo, dateOfBirth;
  UpdateProfileEvent({
    required this.photo,
    required this.name,
    required this.dateOfBirth,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword, newPassword, confirmPassword;
  ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}
