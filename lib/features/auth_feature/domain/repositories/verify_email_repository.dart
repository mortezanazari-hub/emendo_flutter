import 'package:emendo/features/auth_feature/domain/entities/verify_email_entity.dart';

abstract class ValidateEmailRepository {
  Future<ValidateEmailEntity> validateEmail(String token, String code);
}
