import 'package:flutter/material.dart';

import 'package:emendo/core/utils/app_const.dart';

Checkbox myStyleCheckbox(
    {required bool value, void Function(bool?)? onChange}) {
  return Checkbox(
    value: value,
    onChanged: onChange,
    activeColor: AppConst.color4,
    checkColor: AppConst.color6,
    focusColor: AppConst.color3,
    hoverColor: AppConst.color3,
    side: BorderSide(color: AppConst.color4, width: 1),
    splashRadius: 20,
  );
}
