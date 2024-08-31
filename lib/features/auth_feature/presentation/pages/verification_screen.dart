import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/features/auth_feature/presentation/pages/register_screen.dart';
import 'package:emendo/features/auth_feature/presentation/widgets/forget_password_modal.dart';
import 'package:emendo/features/auth_feature/presentation/widgets/register_success_modal.dart';
import 'package:emendo/features/auth_feature/presentation/widgets/result_icon.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verification_Screen extends StatefulWidget {
  const Verification_Screen({super.key});

  @override
  State<Verification_Screen> createState() => _Verification_ScreenState();
}

class _Verification_ScreenState extends State<Verification_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ));
        }, child: const Icon(Icons.arrow_back)),

        //titleSpacing: AppConst.screenWidth * 0.1,
        title: const Text(
          "Verification",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppConst.standardPadding *3),
            Row(
              children: [
                const Spacer(),
                ResultIcon(
                  icon: Icons.mail_lock,
                  color: AppConst.mainColor,
                  size: AppConst.screenWidth * 0.33,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: AppConst.standardPadding),
            Text(
              "Verification Code",
              style: TextStyle(
                fontSize: AppConst.standardTitleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "We have to sent the code to verification",
              style: TextStyle(
                fontSize: AppConst.standardDescriptionFontSize,
                color: AppConst.disabledColor,
              ),
            ),
            SizedBox(height: AppConst.standardPadding * 0.5),
            Text(
              "namo352@gmail.com",
              style: TextStyle(
                fontSize: AppConst.standardDescriptionFontSize,
                color: Colors.black87,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              height: AppConst.standardPadding,
            ),
            SizedBox(
              width: AppConst.screenWidth * .6,
              child: PinCodeTextField(
                appContext: context,
                length: 5,
                keyboardType: TextInputType.number,
                backgroundColor: Colors.white,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(15),
                  fieldHeight: AppConst.standardButtonHeight * 1.1,
                  fieldWidth: AppConst.standardButtonHeight * .9,
                  activeBorderWidth: 0,
                  activeColor: AppConst.mainColor,
                  //borderWidth: 1.5,
                  disabledBorderWidth: 0,
                  inactiveBorderWidth: 0,
                  selectedBorderWidth: 1.5,
                  disabledColor: AppConst.disabledColor,
                  inactiveColor: AppConst.disabledColor,
                  selectedColor: AppConst.mainColor,
                  shape: PinCodeFieldShape.box,
                ),
              ),
            ),
            SizedBox(height: AppConst.standardPadding),
            AppButton(text: "Submit", onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  useSafeArea: true,
                  constraints: BoxConstraints(
                    maxHeight: AppConst.screenHeight * .7,
                    minHeight: 295,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppConst.standardPadding)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const RegisterSuccessModal();
                  });

            }),
            SizedBox(height: AppConst.standardPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the code? "),
                AppLinkText(text: "Resend", onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
