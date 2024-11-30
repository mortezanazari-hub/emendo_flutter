import 'package:dio/dio.dart';
import 'package:emendo/features/auth/data/repository/auth_repositroy_impl.dart';
import 'package:emendo/features/auth/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/dio_interceptor.dart';
import 'config/shared_oprator.dart';
import 'core/utils/app_const.dart';
import 'features/auth/data/remote/api_provider.dart';
import 'features/auth/domain/usecase/login_usecase.dart';
import 'features/auth/domain/usecase/register_usecase.dart';
import 'features/auth/domain/usecase/validate_email_usecase.dart';

GetIt locator = GetIt.instance;

 Future<void> setup() async{
   Dio dio = Dio(
     BaseOptions(
       // connectTimeout: const Duration(seconds: 20),
       // receiveTimeout: const Duration(seconds: 20),
       // sendTimeout: const Duration(seconds: 20),
       baseUrl: AppConst.apiBase,
       connectTimeout: Duration(seconds: 10)
     ),
   );
   dio.interceptors.add(DioInterceptor(dio));
   locator.registerSingleton<Dio>(dio);

   ///shared operator (sharedPreference)
   locator.registerSingleton<SharedPrefOperator>(SharedPrefOperator(await SharedPreferences.getInstance()));

   ///api provider
  // locator.registerSingleton<ApiProvider>(ApiProvider());
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider(dio));


  ///repositories
  // locator.registerSingleton<LoginRepository>(LoginRepositoryImpl(locator()));
  // locator.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(locator()));
  // locator.registerSingleton<UserRepository>(UserRepositoryImpl(locator()));
  // locator.registerSingleton<ValidateEmailRepository>(ValidateEmailRepositoryImpl(locator()));
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl());



   ///usecase
  // locator.registerSingleton<GetUserUseCase>(GetUserUseCase(locator()));
  locator.registerSingleton<ValidateEmailUseCase>(ValidateEmailUseCase());
  locator.registerSingleton<LoginUseCase>(LoginUseCase());
  locator.registerSingleton<RegisterUseCase>(RegisterUseCase());





   ///bloc
  // locator.registerSingleton<LoginCubit>(LoginCubit(locator()));
  // locator.registerSingleton<AuthBloc>(AuthBloc(locator()));

 // locator.registerSingleton<LoginState>(LoginSuccess(locator()));








}