import 'package:bloc/bloc.dart';
import 'package:emendo/features/auth_feature/data/repository/user_repository_impl.dart';
import 'package:emendo/features/auth_feature/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_check_state.dart';

class AuthenticationCubit extends Cubit<bool> {
  bool isAuthenticated = false;

  AuthenticationCubit() : super(false);

  Future<void> checkAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final apiToken = prefs.getString('api_token');

    if (apiToken != null) {
      final UserRepository userRepository;
    }
    emit(isAuthenticated);
  }
}
