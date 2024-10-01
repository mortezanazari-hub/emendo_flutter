import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_input_text.dart';
import 'package:emendo/core/widgets/app_title_description.dart';
import 'package:flutter/material.dart';

class NewPasswordModal extends StatelessWidget {
  const NewPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      body: Column(
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
              title: "Create New Password",
              description: "Enter your new password"),
          SizedBox(height: AppConst.standardPadding),
          AppInputText(
            title: "Password",
            hint: "Create your Password",
            isPassword: true,
            icon: Icons.lock_outline,
            onChanged: (value) => {},
          ),
          AppInputText(
            title: "Re Password",
            hint: "Retype your Password",
            isPassword: true,
            icon: Icons.lock_outline,
            onChanged: (value) => {},
          ),
          SizedBox(height: AppConst.standardPadding),
          AppButton(text: "Send Code", onPressed: () {


          })
        ],
      ),
    );
  }
}
