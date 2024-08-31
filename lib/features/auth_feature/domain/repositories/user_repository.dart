import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String token);
}
