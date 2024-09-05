import 'package:emendo/features/auth_feature/data/api_provider/api_provider.dart';
import 'package:emendo/features/auth_feature/data/repository/login_repository_impl.dart';
import 'package:emendo/features/auth_feature/data/repository/register_repository_impl.dart';
import 'package:emendo/features/auth_feature/data/repository/user_repository_impl.dart';
import 'package:emendo/features/auth_feature/data/repository/verify_email_repository_impl.dart';
import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/login_repository.dart';
import 'package:emendo/features/auth_feature/domain/repositories/register_repository.dart';
import 'package:emendo/features/auth_feature/domain/repositories/user_repository.dart';
import 'package:emendo/features/auth_feature/domain/repositories/verify_email_repository.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/get_user_usecase.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/login_user_usecase.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/register_user_usecase.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/verify_email_usecase.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  ///api provider
  locator.registerSingleton<ApiProvider>(ApiProvider());



  ///repositories
  locator.registerSingleton<LoginRepository>(LoginRepositoryImpl(locator()));
  locator.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(locator()));
  locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator()));
  locator.registerSingleton<ValidateEmailRepository>(ValidateEmailRepositoryImpl(locator()));


  ///usecase
  locator.registerSingleton<GetUserUseCase>(GetUserUseCase(locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
  locator.registerSingleton<RegisterUseCase>(RegisterUseCase(locator()));
  locator.registerSingleton<ValidateEmailUseCase>(ValidateEmailUseCase(locator()));
  
  
  
  ///bloc
  locator.registerSingleton<LoginCubit>(LoginCubit(locator()));
 // locator.registerSingleton<LoginState>(LoginSuccess(locator()));
  


}