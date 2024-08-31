import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.success,
    required super.data,
    required super.apiToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      data: json['data'],
      apiToken: json['meta']['api_token'],
    );
  }
}