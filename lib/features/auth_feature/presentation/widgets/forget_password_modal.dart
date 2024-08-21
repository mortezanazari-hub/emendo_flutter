import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:emendo/features/auth_feature/presentation/widgets/new_password_modal.dart';
import 'package:flutter/material.dart';

class ForgetPasswordModal extends StatelessWidget {
  const ForgetPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppConst.standardPadding * .5),
            Row(
              children: [
                Spacer(),
                Container(
                  width: AppConst.screenWidth * .15,
                  height: 6,
                  decoration: BoxDecoration(
                      color: AppConst.disabledColor,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: AppConst.standardPadding),
            const AppTitleDescription(
                title: "Forget Password",
                description: "Enter your email or phone number"),
            SizedBox(height: AppConst.standardPadding),
            AppInputText(
              title: "Email or Phone Number",
              hint: "Enter your email or phone number",
              icon: Icons.email_outlined,
              onChanged: (value) => {},
            ),
            SizedBox(height: AppConst.standardPadding),
            AppButton(
                text: "Send Code",
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      useSafeArea: true,
                      constraints: BoxConstraints(
                       minHeight: 400,

                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppConst.standardPadding)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const NewPasswordModal();
                      });
                })
          ],
        ),
      ),
    );
  }
}
