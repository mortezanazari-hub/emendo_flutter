import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/first_auth_widget.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class FirstAuthScreen extends StatefulWidget {
  const FirstAuthScreen({super.key});

  @override
  State<FirstAuthScreen> createState() => _FirstAuthScreenState();
}

class _FirstAuthScreenState extends State<FirstAuthScreen> {
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppConst.screenHeight * 0.75,
                //decoration: const BoxDecoration(color: Color(0xff124578)),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _controller,
                        children: const [
                          FirstAuthWidget(
                            svgPath: "lib/core/resources/svg/1.svg",
                            title: "Easy Step To Organize Your Project",
                            des:
                                "Simplify project management with our intuitive tools and achieve more with less effort.",
                          ),
                          FirstAuthWidget(
                            svgPath: "lib/core/resources/svg/2.svg",
                            title: "The Best App For Tracking Your Projects",
                            des:
                                "Simplify project management with our intuitive tools and achieve more with less effort.",
                          ),
                          FirstAuthWidget(
                            svgPath: "lib/core/resources/svg/3.svg",
                            title: "Track Your Work, Get Results",
                            des:
                                "Simplify project management with our intuitive tools and achieve more with less effort.",
                          ),
                        ],
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const WormEffect(
                        activeDotColor: AppConst.mainColor,
                        dotColor: Colors.grey,
                        spacing: 8.0,
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppConst.standardPadding),

              BlocProvider(
                create: (context) => AuthBloc(),
                child: Column(
                  children: [
                    ///Create Account
                    AppButton(
                      text: "Create Account",
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ));
                      },
                    ),
                    const SizedBox(height: 10),

                    ///Already Have an Account
                    AppLinkText(
                      text: "Already Have an Account",
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                      },
                    )
                    //Spacer(),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
