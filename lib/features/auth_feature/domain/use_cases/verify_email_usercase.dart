import 'package:emendo/features/auth_feature/domain/entities/verify_email_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/verify_email_repository.dart';

class ValidateEmailUseCase {
  final ValidateEmailRepository validateEmailRepository;

  ValidateEmailUseCase(this.validateEmailRepository);

  Future<ValidateEmailEntity> call(String token, String code) async {
    return await validateEmailRepository.validateEmail(token, code);
  }
}