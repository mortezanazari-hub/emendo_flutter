import 'package:flutter/material.dart';

import 'package:emendo/core/utils/app_const.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AppButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConst.standardPadding),
      child: SizedBox(
        width: double.infinity,
        height: AppConst.screenWidth * 0.12,
        child: TextButton(
          onPressed: onPressed,
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppConst.mainColor)),
          child: Text(
            text,
            style: TextStyle(
                color: AppConst.secondColor,
                fontSize: AppConst.screenWidth * 0.035),
          ),
        ),
      ),
    );
  }
}
