import 'package:emendo/features/auth_feature/domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.success,
    required super.data,
    required super.apiToken,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      success: json['success'],
      data: json['data'],
      apiToken: json['meta']['api_token'],
    );
  }
}