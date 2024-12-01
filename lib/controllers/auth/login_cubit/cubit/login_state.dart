part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class onLoginSuccess extends LoginState {}
final class onLoginFailure extends LoginState{
  final String errorMessage;
   final String? errorCode; 
  onLoginFailure(this.errorMessage, {this.errorCode});
}
final class onLoginLoading extends LoginState{}
