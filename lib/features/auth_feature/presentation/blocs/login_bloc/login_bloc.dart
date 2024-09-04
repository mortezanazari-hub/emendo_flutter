import 'package:emendo/features/auth_feature/domain/use_cases/login_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/login_bloc/login_event.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/login_bloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(LoginLoading());

      try {
        final loginEntity = await loginUseCase(event.email, event.password);

        //save to shared preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('api_token', loginEntity.apiToken);

        emit(LoginSuccess(loginEntity.apiToken));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}