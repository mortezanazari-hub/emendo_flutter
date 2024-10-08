import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:emendo/features/auth_feature/presentation/blocs/login_cubit/login_cubit.dart';
import 'package:emendo/features/auth_feature/presentation/pages/register_screen.dart';
import 'package:emendo/features/auth_feature/presentation/widgets/forget_password_modal.dart';
import 'package:emendo/features/home_feature/presentation/pages/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'first_auth_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LoginCubit>(),
      child: Builder(builder: (context) {
        TextEditingController emailController = TextEditingController();
        TextEditingController passwordController = TextEditingController();
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print(state.toString());
            if (state is UnauthenticatedState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const FirstAuthScreen(),
              ));
            } else if (state is AuthenticatedState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xffffffff),
            body: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  //todo: delete this line
                  if (kDebugMode) {
                    Future.delayed(const Duration(seconds: 1), () {
                      print("api_token is: ${AppConst.apiToken}");
                    });
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.loginEntity.data)),
                  );
                } else if (state is LoginError) {
                  //todo: delete this line
                  if (kDebugMode) {
                    Future.delayed(const Duration(seconds: 1), () {
                      print("error is: ${state.loginEntity.data}");
                    });
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(state.loginEntity.success.toString())),
                  );
                }
              },
              child: SingleChildScrollView(
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
                        AppButton(
                          text: "Sign In",
                          onPressed: () {
                            context.read<LoginCubit>().login(
                                  emailController.text,
                                  passwordController.text,
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
                                        "apiToken is: ${AppConst.apiToken}")),
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
            ),
          ),
        );
      }),
    );
  }
}
