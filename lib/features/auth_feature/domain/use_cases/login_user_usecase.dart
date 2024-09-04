import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<LoginEntity> call(String email, String password) async {
    return await loginRepository.login(email, password);
  }
}