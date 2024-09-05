import 'package:emendo/di.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:emendo/features/splash_feature/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_const.dart';

void main() async {
  ///dependency injection
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppConst.screenWidth = MediaQuery.of(context).size.width;
    AppConst.screenHeight = MediaQuery.of(context).size.height;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmenDo',
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => locator<LoginCubit>()),
          ],
          child:const SplashScreen()),
    );
  }
}
