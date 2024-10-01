import 'package:emendo/Common/error_handling/data_state.dart';
import 'package:emendo/Common/param/login_param.dart';
import 'package:emendo/Common/param/register_param.dart';

abstract class AuthRepository{
  Future <DataState<dynamic>> loginRep(LoginParam param);
  Future <DataState<dynamic>> registerRep(RegisterParam param);
  Future <DataState<dynamic>> emailValidationRep(String code);
}