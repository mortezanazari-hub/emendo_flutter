import 'package:flutter/material.dart';

import 'package:emendo/core/utils/app_const.dart';

class MyStyleSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;

  const MyStyleSwitch({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      trackOutlineWidth: WidgetStatePropertyAll(1),
      trackOutlineColor: WidgetStatePropertyAll(AppConst.color3),
      value: value,
      inactiveThumbColor: AppConst.color5,
      inactiveTrackColor: AppConst.color1,
      thumbColor: WidgetStatePropertyAll(AppConst.color5),
      activeColor: AppConst.color4,
      onChanged: onChanged,
    );
  }
}
