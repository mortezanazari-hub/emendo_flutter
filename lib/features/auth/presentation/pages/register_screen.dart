import 'package:emendo/Common/param/register_param.dart';
import 'package:emendo/config/shared_oprator.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/entities/auth_entity.dart';
import 'package:emendo/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:emendo/features/auth/presentation/pages/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController userNameController;

  late TextEditingController emailOrNumberController;
  late TextEditingController passwordController;
  late AuthBloc bloc;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    emailOrNumberController = TextEditingController();
    passwordController = TextEditingController();
    bloc = AuthBloc();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailOrNumberController.dispose();
    passwordController.dispose();
    bloc.close();
  }

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
              controller: userNameController,
              title: "Username",
              hint: "Create your username",
              icon: Icons.person_outline_outlined,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            AppInputText(
              controller: emailOrNumberController,
              title: "Email or Phone Number",
              hint: "Enter your email or phone number",
              icon: Icons.email_outlined,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            AppInputText(
              controller: passwordController,
              title: "Password",
              hint: "Create your Password",
              isPassword: true,
              icon: Icons.lock_outline,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            BlocConsumer(
              bloc: bloc,
              buildWhen: (previous, current) =>
                  current is RegisterLoading ||
                  current is RegisterSuccess ||
                  current is RegisterFailed,
              listenWhen: (previous, current) =>
                  current is RegisterLoading ||
                  current is RegisterSuccess ||
                  current is RegisterFailed,
              listener: (context, state) {
                if (state is RegisterFailed) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
                if (state is RegisterSuccess) {
                  AuthEntity authEntity = state.authEntity;
                  locator<SharedPrefOperator>()
                      .setUserToken(state.authEntity.token);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.authEntity.message),
                    backgroundColor: Colors.green,
                  ));
                  SnackBar(content: Text(state.authEntity.message));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationScreen(
                        token: authEntity.token,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return AppButton(
                  text: "Create Account",
                  onPressed: () {
                    bloc.add(RegisterEvent(
                      registerParam: RegisterParam(
                        userNameController.text,
                        emailOrNumberController.text,
                        passwordController.text,
                      ),
                    ));
                  },
                );
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
