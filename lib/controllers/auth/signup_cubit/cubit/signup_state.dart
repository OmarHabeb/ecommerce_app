part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
class onSignupLoading extends SignupState {}
final class onSignupSuccess extends SignupState {}
final class onSignupError extends SignupState {
  final String errorMessage;

  onSignupError(this.errorMessage);
}