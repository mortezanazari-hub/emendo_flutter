part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent{
  final LoginParam loginParam;

  LoginEvent({required this.loginParam});
}

class RegisterEvent extends AuthEvent{
  final RegisterParam registerParam;

  RegisterEvent({required this.registerParam});
}

class ValidationEmailEvent extends AuthEvent{
  final String code;

  ValidationEmailEvent({required this.code});
}
