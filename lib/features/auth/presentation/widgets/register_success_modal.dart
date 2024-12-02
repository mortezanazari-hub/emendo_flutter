import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/features/auth/presentation/widgets/result_icon.dart';
import 'package:flutter/material.dart';

import '../../../main/presentation/pages/home_screen.dart';

class RegisterSuccessModal extends StatelessWidget {
  const RegisterSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppConst.standardPadding * 2),
          const Center(
              child: ResultIcon(
            size: 100,
            color: AppConst.mainColor,
            icon: Icons.check_circle,
          )),
          SizedBox(height: AppConst.standardPadding * 2),
          Text(
            "Register Success",
            style: TextStyle(
                fontSize: AppConst.standardTitleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          SizedBox(height: AppConst.standardPadding * 0.5),
          Text(
            textAlign: TextAlign.center,
            "Congratulation! your account already created.\n"
            "Please login to get amazing experience.",
            style: TextStyle(
                fontSize: AppConst.standardDescriptionFontSize,
                color: AppConst.disabledColor),
          ),
          SizedBox(height: AppConst.standardPadding * 2),
          AppButton(
              text: "Go to Homepage",
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              })
        ],
      ),
    );
  }
}
