import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final bool success;
  final String data;
  final String apiToken;

  const RegisterEntity({
    required this.success,
    required this.data,
    required this.apiToken,
  });

  @override
  List<Object> get props => [success, data, apiToken];
}
