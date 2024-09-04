import 'package:emendo/di.dart';
import 'package:emendo/features/splash_feature/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/app_const.dart';

void main() async {
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmenDo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

      home: SplashScreen(),
    );
  }
}
