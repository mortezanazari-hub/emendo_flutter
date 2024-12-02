import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/setting/presentation/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  ///dependency injection
  await setup();

  runApp(
      const MyApp());
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
      home: SettingScreen(),
    );
  }
}
