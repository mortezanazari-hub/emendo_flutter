import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthenticatedState extends AuthState {
  final UserEntity user;
  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthState {}

class LoadingState extends AuthState {}
