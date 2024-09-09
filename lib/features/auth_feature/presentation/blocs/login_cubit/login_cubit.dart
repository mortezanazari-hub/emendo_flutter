import 'package:bloc/bloc.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/login_user_usecase.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

   Future login(String email, String password) async {
    try {
      emit(LoginLoading());
      emit(LoginSuccess(await loginUseCase.loginRepository.login(email, password)));
    } catch (e) {
      emit(LoginError(await loginUseCase.loginRepository.login(email, password)));
    }
  }
}


