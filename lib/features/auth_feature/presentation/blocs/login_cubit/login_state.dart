part of 'login_cubit.dart';

abstract class LoginState {}

@immutable
class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginEntity loginEntity;

  LoginSuccess(this.loginEntity) ;
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
