import 'package:emendo/features/auth_feature/domain/entities/register_entity.dart';

abstract class RegisterRepository {
  Future<RegisterEntity> register(String username, String email, String password);
}
