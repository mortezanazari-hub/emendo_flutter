
import 'package:emendo/features/auth_feature/data/api_provider/api_provider.dart';
import 'package:emendo/features/auth_feature/data/models/login_model.dart';
import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiProvider apiProvider;

  LoginRepositoryImpl(this.apiProvider);

  @override
  Future<LoginEntity> login(String email, String password) async {
    try {
      final response = await apiProvider.post(
        "/login",
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}