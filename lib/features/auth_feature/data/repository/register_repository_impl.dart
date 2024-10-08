import 'package:emendo/features/auth_feature/data/api_provider/api_provider.dart';
import 'package:emendo/features/auth_feature/data/models/register_model.dart';
import 'package:emendo/features/auth_feature/domain/entities/register_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final ApiProvider apiProvider;

  RegisterRepositoryImpl(this.apiProvider);

  @override
  Future<RegisterEntity> register(String username, String email, String password) async {
    try {
      final response = await apiProvider.post(
        "/register",
        queryParameters: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      throw Exception('Failed to register: $e');
    }
  }
}