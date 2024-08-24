import 'package:flutter/material.dart';

import 'package:emendo/core/utils/app_const.dart';

class AppLinkText extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextAlign? textAlign;

  const AppLinkText({
    this.textAlign,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyle(
          color: AppConst.mainColor,
          fontSize: AppConst.standardDescriptionFontSize,
        ),
      ),
    );
  }
}
