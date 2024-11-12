import 'package:emendo/Common/error_handling/data_state.dart';
import 'package:emendo/Common/param/register_param.dart';
import 'package:emendo/config/usecase.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/repository/auth_repository.dart';


class ValidateEmailUseCase implements UseCase<DataState,String> {

  @override
  Future<DataState<dynamic>> call({required String param}) {
    return locator<AuthRepository>().emailValidationRep(param);
  }
}