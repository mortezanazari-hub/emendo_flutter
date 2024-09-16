import 'package:emendo/di.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:emendo/features/splash_feature/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/app_const.dart';

void main() async {
  ///dependency injection
  await setup();

  runApp(Builder(
    builder: (context) {
      AppConst.screenWidth = MediaQuery.of(context).size.width;
      AppConst.screenHeight = MediaQuery.of(context).size.height;
      return MultiBlocProvider(
        providers: [BlocProvider<AuthBloc>(create: (context) => AuthBloc(locator()),)],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EmenDo',
          home: SplashScreen(),
        ),
      );
    }
  ));
}

