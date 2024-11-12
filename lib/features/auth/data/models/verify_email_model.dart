
import 'package:emendo/features/auth/domain/entities/verify_email_entity.dart';

class ValidateEmailModel extends ValidateEmailEntity {
  const ValidateEmailModel({
    required super.success,
    required super.data,
  });

  factory ValidateEmailModel.fromJson(Map<String, dynamic> json) {
    return ValidateEmailModel(
      success: json['success'],
      data: json['data'],
    );
  }
}