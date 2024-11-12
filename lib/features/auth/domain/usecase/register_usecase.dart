import 'package:emendo/Common/error_handling/data_state.dart';
import 'package:emendo/Common/param/register_param.dart';
import 'package:emendo/config/usecase.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase implements UseCase<DataState,RegisterParam> {

  @override
  Future<DataState<dynamic>> call({required RegisterParam param}) {
    return locator<AuthRepository>().registerRep(param);
  }
}