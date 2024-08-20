import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/features/auth_feature/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 40),
            const AppTitleDescription(
              title: "Login Account",
              description: "Please login to your account",
            ),
            SizedBox(height: AppConst.standardPadding * 1.8),
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
            SizedBox(height: AppConst.standardPadding*0.5),
            Padding(
              padding: EdgeInsets.only(right: AppConst.standardPadding),
              child: Row(
                children: [
                  const Spacer(),
                  AppLinkText(
                    text: "Forget Password?",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: AppConst.standardPadding*0.5),
            AppButton(
              text: "Sign In",
              onPressed: () {},
            ),
            SizedBox(height: AppConst.standardPadding*0.5),
            Padding(
              padding: EdgeInsets.only(right: AppConst.standardPadding),
              child: Row(
                children: [
                  const Spacer(),
                  AppLinkText(
                    text: "Don't have any account?",
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
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
                    "Sign in with Google (coming soon)",
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
