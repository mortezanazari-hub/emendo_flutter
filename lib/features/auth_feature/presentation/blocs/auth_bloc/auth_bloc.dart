import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
        emit(UnauthenticatedState());
        return;
      }
      try {
        UserEntity userEntity = await getUserUseCase.userRepository.getUser(apiToken);
        AppConst.lastOnlineDate = DateTime.now();
        emit(AuthenticatedState());
      } on DioException catch (e) {
        // Unauthenticated api token
        if (e.response?.statusCode == 405) {
          emit(UnauthenticatedState());
        }
        if (e.type == DioExceptionType.connectionError) {
          var currentDate = DateTime.now();
          final lastOnlineDate = AppConst.lastOnlineDate;
          var lastOnlineDateDifferenceBool = lastOnlineDate != null &&
              currentDate.difference(lastOnlineDate).inDays > 30;
          if (lastOnlineDateDifferenceBool) {
            // Token expired due to offline limit
            AppConst.apiTokenToNull(); // Clear token
            emit(UnauthenticatedState());
          } else {
            emit(AuthenticatedState());
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
