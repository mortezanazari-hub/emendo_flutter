import 'package:emendo/Common/error_handling/data_state.dart';
import 'package:emendo/Common/param/login_param.dart';
import 'package:emendo/config/usecase.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase implements UseCase<DataState,LoginParam> {

  @override
  Future<DataState<dynamic>> call({required LoginParam param}) {
    return locator<AuthRepository>().loginRep(param);
  }
}