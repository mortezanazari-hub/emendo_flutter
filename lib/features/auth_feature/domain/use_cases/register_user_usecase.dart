import 'package:emendo/features/auth_feature/domain/entities/register_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository registerRepository;

  RegisterUseCase(this.registerRepository);

  Future<RegisterEntity> call(String username, String email, String password) async {
    return await registerRepository.register(username, email, password);
  }
}