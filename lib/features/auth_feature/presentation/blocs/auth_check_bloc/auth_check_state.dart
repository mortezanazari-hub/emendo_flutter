part of 'auth_check_bloc.dart';

sealed class AuthCheckState extends Equatable {
  const AuthCheckState();
}

final class AuthCheckInitial extends AuthCheckState {
  @override
  List<Object> get props => [];
}
