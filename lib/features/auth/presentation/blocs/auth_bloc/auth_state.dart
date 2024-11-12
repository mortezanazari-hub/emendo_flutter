part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

///--- Login States

class LoginLoading extends AuthState{}

class LoginSuccess extends AuthState{
  final AuthEntity authEntity;
  LoginSuccess({required this.authEntity});
}

class LoginFailed extends AuthState{
  final String message;

  LoginFailed({required this.message});
}

///--- Register States

class RegisterLoading extends AuthState{}

class RegisterSuccess extends AuthState{
  final AuthEntity authEntity;
  RegisterSuccess({required this.authEntity});
}

class RegisterFailed extends AuthState{
  final String message;

  RegisterFailed({required this.message});
}


///--- validation Email States

class ValidationEmailLoading extends AuthState{}

class ValidationEmailSuccess extends AuthState{
  final ValidateEmailEntity validateEmailEntity;
  ValidationEmailSuccess({required this.validateEmailEntity});
}

class ValidationEmailFailed extends AuthState{
  final String message;

  ValidationEmailFailed({required this.message});
}