import 'package:dio/dio.dart';
import 'package:emendo/Common/error_handling/check_exceptions.dart';
import 'package:emendo/Common/error_handling/data_state.dart';
import 'package:emendo/Common/param/login_param.dart';
import 'package:emendo/Common/param/register_param.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/data/models/auth_model.dart';
import 'package:emendo/features/auth/data/remote/api_provider.dart';
import 'package:emendo/features/auth/domain/entities/auth_entity.dart';
import 'package:emendo/features/auth/domain/entities/verify_email_entity.dart';
import 'package:emendo/features/auth/domain/repository/auth_repository.dart';

import '../models/verify_email_model.dart';

class AuthRepositoryImpl extends AuthRepository{

  @override
  Future<DataState> loginRep(LoginParam param) async{
    try {
      final Response response = await locator<AuthApiProvider>().callLogin(param);
      AuthEntity authEntity = AuthModel.fromJson(response.data);
      return DataSuccess(authEntity);
    } catch (e){
    return CheckExceptions.getError(e);
    }
  }

  @override
  Future<DataState> registerRep(RegisterParam param) async{
    try {
      Response response = await locator<AuthApiProvider>().callRegister(param);
      AuthEntity authEntity = AuthModel.fromJson(response.data);
      return DataSuccess(authEntity);
    } catch (e){
      return CheckExceptions.getError(e);
    }
  }

  @override
  Future<DataState> emailValidationRep(String code) async{
    try {
      Response response = await locator<AuthApiProvider>().callValidationEmail(code);
      ValidateEmailEntity validateEmailEntity = ValidateEmailModel.fromJson(response.data);
      return DataSuccess(validateEmailEntity);
    } catch (e){
      return CheckExceptions.getError("Validate Email Failed");
    }
  }
}