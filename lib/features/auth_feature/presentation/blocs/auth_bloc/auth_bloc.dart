import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:emendo/core/utils/user_preferences.dart';
import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/get_user_usecase.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserUseCase getUserUseCase;

  AuthBloc(this.getUserUseCase) : super(LoadingState()) {
    on<CheckAuthStatusEvent>((event, emit) async {
      // Loading state
      emit(LoadingState());

      // Get token from storage
      final apiToken = AppConst.apiToken;

      if (apiToken == null) {
        // Unauthenticated: no token found
        await UserPreferences.clearUser();
        emit(UnauthenticatedState());
        return;
      }
      try {
        UserEntity? userEntity =await UserPreferences.getUser();
        AppConst.lastOnlineDate = DateTime.now();
        emit(AuthenticatedState(userEntity!));
      } on DioException catch (e) {
        // Unauthenticated api token
        if (e.response?.statusCode == 405) {
          await UserPreferences.clearUser();
          emit(UnauthenticatedState());
        }
        if (e.type == DioExceptionType.connectionError) {
          var currentDate = DateTime.now();
          final lastOnlineDate = AppConst.lastOnlineDate;
          var lastOnlineDateDifferenceBool = lastOnlineDate != null &&
              currentDate.difference(lastOnlineDate).inDays > 30;
          if (lastOnlineDateDifferenceBool) {
            // Token expired due to offline limit
            await UserPreferences.clearUser();
            emit(UnauthenticatedState());
          } else {
            UserEntity? userEntity =await UserPreferences.getUser();

            emit(AuthenticatedState(userEntity!));
          }
        }
      }
    });

    on<LogoutEvent>((event, emit) {
      // Clear token and emit unauthenticated state
      AppConst.apiToken = null;
      emit(UnauthenticatedState());
    });
  }
}
