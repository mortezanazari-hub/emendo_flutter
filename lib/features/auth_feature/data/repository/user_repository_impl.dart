import 'package:emendo/features/auth_feature/data/api_provider/api_provider.dart';
import 'package:emendo/features/auth_feature/data/models/user_model.dart';
import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiProvider apiProvider;

  UserRepositoryImpl(this.apiProvider);

  @override
  Future<UserEntity> getUser(String token) async {
    try {
      final response = await apiProvider.get(
        "/user",
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(response.data);
        return userModel;
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
}
