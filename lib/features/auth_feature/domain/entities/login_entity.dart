import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final bool success;
  final String data;
  final String apiToken;

  const LoginEntity({
    required this.success,
    required this.data,
    required this.apiToken,
  });

  @override
  List<Object> get props => [success, data, apiToken];
}