import 'package:dio/dio.dart';
import 'package:emendo/features/auth_feature/data/api_provider/api_provider.dart';
import 'package:emendo/features/auth_feature/data/models/verify_email_model.dart';
import 'package:emendo/features/auth_feature/domain/entities/verify_email_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/verify_email_repository.dart';

class ValidateEmailRepositoryImpl implements ValidateEmailRepository {
  final ApiProvider apiProvider;

  ValidateEmailRepositoryImpl(this.apiProvider);

  @override
  Future<ValidateEmailEntity> validateEmail(String token, String code) async {
    try {
      final response = await apiProvider.post(
        "/verify",
        data: {
          'code': code,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return ValidateEmailModel.fromJson(response.data);
      } else {
        throw Exception('Failed to validate email');
      }
    } catch (e) {
      throw Exception('Failed to validate email: $e');
    }
  }
}
