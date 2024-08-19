import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        AppInputText(
          title: "Username",
          hint: "Create your username",
          icon: Icons.person_outline_outlined,
          onChanged: (value) => {},
        ),
        const SizedBox(height: 10),
        AppInputText(
          title: "Email or Phone Number",
          hint: "Enter your email or phone number",
          icon: Icons.email_outlined,
          onChanged: (value) => {},
        ),
        const SizedBox(height: 10),
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
