import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthenticatedState extends AuthState {
  final UserEntity userEntity;
  AuthenticatedState(this.userEntity);
}

class UnauthenticatedState extends AuthState {}

class LoadingState extends AuthState {}
