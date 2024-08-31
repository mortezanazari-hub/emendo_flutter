import 'package:dio/dio.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/auth_feature/data/models/user_model.dart';
import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final Dio dio;

  UserRepositoryImpl(this.dio);

  @override
  Future<UserEntity> getUser(String token) async {
    try {
      final response = await dio.get(
        "${AppConst.apiBase}/user",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
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
