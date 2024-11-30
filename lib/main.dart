import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:emendo/features/tasks/presentation/screen/task_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///dependency injection
  await setup();

  runApp(Builder(builder: (context) {
    // AppConst.screenWidth = MediaQuery.of(context).size.width;
    // AppConst.screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
    ], child: const MyApp());
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppConst.color4,
        fontFamily: 'NauticaRounded',
      ),
      debugShowCheckedModeBanner: false,
      title: 'EmenDo',
      home: TaskEditScreen(),
      // home: HomeScreen(),
      // home: SplashScreen(),
    );
  }
}
