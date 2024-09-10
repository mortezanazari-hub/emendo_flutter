import 'package:bloc/bloc.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/get_user_usecase.dart';
import 'package:emendo/features/auth_feature/domain/usecases/get_user_usecase.dart';
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
        // If offline, check if we should force logout
        if (/* check offline status */) {
          final lastOnlineDate = AppConst.lastOnlineDate;
          final currentDate = DateTime.now();

          if (lastOnlineDate != null && currentDate.difference(lastOnlineDate).inDays > 7) {
            // Token expired due to offline limit
            AppConst.apiToken = null;  // Clear token
            emit(UnauthenticatedState());
            return;
          }

          // Still within 7 days, remain authenticated
          emit(AuthenticatedState(/* retrieve user details from local */));
          return;
        }

        // Check online for valid token
        final user = await getUserUseCase(apiToken);
        // Save last online date
        AppConst.lastOnlineDate = DateTime.now();

        emit(AuthenticatedState(user));
      } catch (e) {
        // Error occurred, assume unauthenticated
        emit(UnauthenticatedState());
      }
    });

    on<LogoutEvent>((event, emit) {
      // Clear token and emit unauthenticated state
      AppConst.apiToken = null;
      emit(UnauthenticatedState());
    });
  }
}
