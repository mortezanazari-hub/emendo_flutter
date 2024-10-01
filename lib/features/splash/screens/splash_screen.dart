import 'package:dio/dio.dart';
import 'package:emendo/config/api_config.dart';
import 'package:emendo/config/shared_oprator.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/presentation/pages/first_auth_screen.dart';
import 'package:emendo/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    goToNextScreen();
  }

  // @override
  // void dispose() {
  //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //   //     overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffffffff),
      // body: BlocListener<AuthBloc, AuthState>(
      //   listener: (context, state) {
      //     print(state.toString());
      //     if (state is UnauthenticatedState) {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (context) => const FirstAuthScreen(),
      //       ));
      //     } else if (state is AuthenticatedState) {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (context) => const HomeScreen(),
      //       ));
      //     }
      //   },
        body: Column(
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
                  style: TextStyle(color: AppConst.mainColor, fontSize: 33),
                ),
              ],
            ),
            SizedBox(height: 10),
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
            SizedBox(height: 20),
          ],
        ),
    );
  }


    Future<void> goToNextScreen() async {
    bool loggedIn = locator<SharedPrefOperator>().getIntroState();
    Future.delayed(const Duration(seconds: 3)).then((value){
      if (loggedIn) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FirstAuthScreen(),));
      }
    });
  }
}
