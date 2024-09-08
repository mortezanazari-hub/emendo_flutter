import 'package:equatable/equatable.dart';

class LoginEntity {
  final bool success;
  final String data;
  final String? apiToken;

  const LoginEntity({
    required this.success,
    required this.data,
    this.apiToken,
  });
}
