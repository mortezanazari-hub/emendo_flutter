import 'package:bloc/bloc.dart';
import 'package:emendo/Common/error_handling/data_state.dart';
import 'package:emendo/Common/param/login_param.dart';
import 'package:emendo/Common/param/register_param.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/entities/auth_entity.dart';
import 'package:emendo/features/auth/domain/entities/verify_email_entity.dart';
import 'package:emendo/features/auth/domain/usecase/login_usecase.dart';
import 'package:emendo/features/auth/domain/usecase/register_usecase.dart';
import 'package:emendo/features/auth/domain/usecase/validate_email_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{

      ///--- login
      if(event is LoginEvent){
        emit(LoginLoading());
        DataState dataState = await locator<LoginUseCase>().call(param: event.loginParam);
        dataState is DataSuccess
            ? emit(LoginSuccess(authEntity: dataState.data))
            : emit(LoginFailed(message: dataState.message!));
      }

      ///--- register
      if(event is RegisterEvent){
        emit(RegisterLoading());
        DataState dataState = await locator<RegisterUseCase>().call(param: event.registerParam);
        dataState is DataSuccess
            ? emit(RegisterSuccess(authEntity: dataState.data))
            : emit(RegisterFailed(message: dataState.message!));
      }

      ///--- emailValidation
      if(event is ValidationEmailEvent){
        DataState dataState = await locator<ValidateEmailUseCase>().call(param: event.code);
        dataState is DataSuccess
            ? emit(ValidationEmailSuccess(validateEmailEntity: dataState.data))
            : emit(ValidationEmailFailed(message: dataState.message!));
      }
    });
  }
}
