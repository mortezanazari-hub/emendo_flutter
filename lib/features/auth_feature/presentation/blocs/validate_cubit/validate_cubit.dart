import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validate_state.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(ValidateInitial());
}
