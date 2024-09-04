import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  Future<UserEntity> call(String token) async {
    return await userRepository.getUser(token);
  }
}