import 'dart:ui';

import 'package:flutter/cupertino.dart';

final Color baseColor = Color(0xFFB8E7A9);
final List<Color> colors = [
  Color(0xffFFFFFF),
  Color(0xFFFAFFFA),
  Color(0xFFE9F9E9),
  Color(0xFFD7F3D7),
  Color(0xFFB8E7A9),
  Color(0xFF637D5B),
  Color(0xFF637D5B),
  Color(0xFF394834),
  Color(0xFF0E120C),
];

List<Color> adjustColors(Color newBaseColor) {
  List<Color> adjustedColors = [];

  // استخراج HSV (Hue, Saturation, Value) رنگ پایه
  final baseHsv = HSVColor.fromColor(Color(0xff9EDF9C));
  final newHsv = HSVColor.fromColor(newBaseColor);

  final hueDifference = newHsv.hue - baseHsv.hue;
  final saturationRatio = newHsv.saturation / baseHsv.saturation;
  final valueRatio = newHsv.value / baseHsv.value;

  // اعمال تغییرات به بقیه رنگ‌ها
  for (var color in colors) {
    final hsv = HSVColor.fromColor(color);

    final adjustedHue = (hsv.hue + hueDifference) % 360;
    final adjustedSaturation =
        (hsv.saturation * saturationRatio).clamp(0.0, 1.0);
    final adjustedValue = (hsv.value * valueRatio).clamp(0.0, 1.0);

    final adjustedColor = HSVColor.fromAHSV(
      hsv.alpha,
      adjustedHue,
      adjustedSaturation,
      adjustedValue,
    ).toColor();

    adjustedColors.add(adjustedColor);
  }

  return adjustedColors;
}
