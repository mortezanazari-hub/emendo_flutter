import 'package:flutter/material.dart';

import 'package:emendo/core/utils/app_const.dart';

class AppLinkText extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AppLinkText({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: AppConst.mainColor,
            fontSize: AppConst.screenWidth * 0.035),
      ),
    );
  }
}
