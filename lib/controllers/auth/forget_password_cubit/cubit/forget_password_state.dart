part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordLoading extends ForgetPasswordState{}
class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message; 
  ForgetPasswordSuccess(this.message);
}
class ForgetPasswordError extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordError(this.errorMessage);
}