import 'package:emendo/Common/param/login_param.dart';
import 'package:emendo/config/shared_oprator.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/entities/auth_entity.dart';
import 'package:emendo/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:emendo/features/auth/presentation/pages/register_screen.dart';
import 'package:emendo/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/forget_password_modal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AuthBloc bloc;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    bloc = AuthBloc();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    controller: emailController,
                    onChanged: (value) => {},
                  ),
                  SizedBox(height: AppConst.standardPadding),
                  AppInputText(
                    title: "Password",
                    hint: "Enter your Password",
                    isPassword: true,
                    icon: Icons.lock_outline,
                    controller: passwordController,
                    onChanged: (value) => {},
                  ),
                  SizedBox(height: AppConst.standardPadding * 0.1),
                  Padding(
                    padding:
                        EdgeInsets.only(right: AppConst.standardPadding),
                    child: Row(
                      children: [
                        const Spacer(),
                        AppLinkText(
                          text: "Forget Password?",
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                useSafeArea: true,
                                constraints: BoxConstraints(
                                  maxHeight: AppConst.screenHeight * .35,
                                  minHeight: 295,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(
                                          AppConst.standardPadding)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return const ForgetPasswordModal();
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppConst.standardPadding),
                  BlocConsumer(
                    bloc: bloc,
                    buildWhen: (previous, current) => current is LoginLoading || current is LoginSuccess || current is LoginFailed,
                    listenWhen: (previous, current) => current is LoginLoading || current is LoginSuccess || current is LoginFailed,
                    listener: (context, state) {
                      if(state is LoginSuccess){
                        AuthEntity authEntity = state.authEntity;
                        locator<SharedPrefOperator>().setUserToken(authEntity.token);
                        SnackBar(content: Text(state.authEntity.message));
                          Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen(),),
                              (route) => false,
                        );
                      }
                      if(state is LoginFailed){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)
                            )
                        );
                      }
                    },
                    builder: (context, state) {
                      if(state is LoginLoading){
                        return const Center(child: CircularProgressIndicator());
                      }
                      return AppButton(
                        text: "Sign In",
                        onPressed: () {
                          bloc.add(
                              LoginEvent(
                                  loginParam: LoginParam(
                                      emailController.text,
                                      passwordController.text,
                                  ),
                              ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                      text: "test",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "apiToken is: ${locator<SharedPrefOperator>().getUserToken()}")),
                        );
                      }),
                  SizedBox(height: AppConst.standardPadding * 0.1),
                  Padding(
                    padding:
                        EdgeInsets.only(right: AppConst.standardPadding),
                    child: Row(
                      children: [
                        const Spacer(),
                        AppLinkText(
                          text: "Don't have any account?",
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterScreen(),
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
                  SizedBox(height: AppConst.standardPadding * .25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Spacer(),
                      SvgPicture.asset(
                        "lib/core/resources/svg/Google_G_logo.svg",
                        colorFilter: const ColorFilter.mode(
                            AppConst.disabledColor, BlendMode.saturation),
                        // color: AppConst.disabledColor,
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
