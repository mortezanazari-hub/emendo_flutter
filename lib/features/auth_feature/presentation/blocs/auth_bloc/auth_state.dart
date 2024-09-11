import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthenticatedState extends AuthState {
  AuthenticatedState();
}

class UnauthenticatedState extends AuthState {}

class LoadingState extends AuthState {}
