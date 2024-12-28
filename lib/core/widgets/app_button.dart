import 'package:flutter/material.dart';

import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppConst.color3),
          color: AppConst.color2,
        ),
        width: double.infinity,
        height: AppConst.screenWidth * 0.12,
        child: TextButton(
          onPressed: onPressed,
          style: const ButtonStyle(
              surfaceTintColor: WidgetStatePropertyAll(AppConst.color2),
              backgroundColor: WidgetStatePropertyAll(AppConst.color1)),
          child: Text(
            text,
            style: TextStyle(
                color: AppConst.color6, fontSize: AppConst.screenWidth * 0.035),
          ),
        ),
      ),
    );
  }
}
