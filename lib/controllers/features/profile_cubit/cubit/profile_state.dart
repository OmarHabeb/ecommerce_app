part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final User user;

  ProfileSuccess(this.user);
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}


final class UpdateProfileSuccess extends ProfileState {
}
