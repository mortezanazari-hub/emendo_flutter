import 'package:emendo/features/auth_feature/presentation/pages/login_screen.dart';
import 'package:emendo/features/auth_feature/presentation/pages/verification_screen.dart';
import 'package:emendo/features/splash_feature/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/utils/app_const.dart';

void main() {
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

      home: Verification_Screen(),
    );
  }
}
