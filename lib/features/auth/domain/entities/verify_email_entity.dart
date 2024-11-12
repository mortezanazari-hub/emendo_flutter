import 'package:equatable/equatable.dart';

class ValidateEmailEntity extends Equatable {
  final bool success;
  final String data;

  const ValidateEmailEntity({
    required this.success,
    required this.data,
  });

  @override
  List<Object> get props => [success, data];
}
