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
                  Text(
                    "Emen",
                    style: TextStyle(color: Color(0xff121212), fontSize: 33),
                  ),
                  Text(
                    "Do.",
                    style: TextStyle(color: Color(0xff479b2c), fontSize: 33),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Project Management App",
                style: TextStyle(
                    color: Color(0xff777985),
                    fontSize: 18,
                    fontWeight: FontWeight.w100),
              ),
              Spacer(),
              Text(
                AppConst.appVersion,
                style: TextStyle(
                    color: Color(0xffa8afc2),
                    fontSize: 10,
                    fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20,)
            ],
          )),
    );
  }
}
