import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_check_event.dart';
part 'auth_check_state.dart';

class AuthCheckBloc extends Bloc<AuthCheckEvent, AuthCheckState> {
  AuthCheckBloc() : super(AuthCheckInitial()) {
    on<AuthCheckEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
