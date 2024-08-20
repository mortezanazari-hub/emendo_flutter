import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
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
        const Spacer(),
      ]),
    );
  }
}
