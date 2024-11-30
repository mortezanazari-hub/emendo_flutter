// ignore_for_file: deprecated_member_use

import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/features/auth/presentation/pages/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 40),
            const AppTitleDescription(
              title: "Create Account",
              description: "Start management with create your account",
            ),
            SizedBox(height: AppConst.standardPadding * 1.8),
            AppInputText(
              title: "Username",
              hint: "Create your username",
              icon: Icons.person_outline_outlined,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            AppInputText(
              title: "Email or Phone Number",
              hint: "Enter your email or phone number",
              icon: Icons.email_outlined,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            AppInputText(
              title: "Password",
              hint: "Create your Password",
              isPassword: true,
              icon: Icons.lock_outline,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            AppButton(
              text: "Create Account",
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Verification_Screen(),
                ));
              },
            ),
            SizedBox(height: AppConst.standardPadding * 0.5),
            Padding(
              padding: EdgeInsets.only(right: AppConst.standardPadding),
              child: Row(
                children: [
                  const Spacer(),
                  AppLinkText(
                    text: "Already have account?",
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConst.standardPadding),
            const Center(
              child: Text(
                "Or using other methode",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppConst.disabledColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: AppConst.standardPadding * .75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(),
                SvgPicture.asset(
                  "lib/core/resources/svg/Google_G_logo.svg",
                  color: AppConst.disabledColor,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign Up with Google (coming soon)",
                    style: TextStyle(color: AppConst.disabledColor),
                  ),
                ),
                //  const Spacer()
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
