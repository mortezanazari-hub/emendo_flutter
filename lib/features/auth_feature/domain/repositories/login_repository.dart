import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<LoginEntity> login(String email, String password);
}
