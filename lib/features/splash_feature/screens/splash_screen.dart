import 'package:emendo/features/auth_feature/presentation/pages/first_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/app_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const FirstAuthScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Emen
                  Text(
                    "Emen",
                    style: TextStyle(color: Color(0xff121212), fontSize: 33),
                  ),

                  ///Do.
                  Text(
                    "Do.",
                    style: TextStyle(color: AppConst.mainColor, fontSize: 33),
                  ),
                ],
              ),
              SizedBox(height: 10),

              ///Project Management App
              Text(
                "Project Management App",
                style: TextStyle(
                    color: Color(0xff777985),
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
              Spacer(),

              ///version
              Text(
                AppConst.appVersion,
                style: TextStyle(
                    color: Color(0xffa8afc2),
                    fontSize: 10,
                    fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20)
            ],
          )),
    );
  }
}
