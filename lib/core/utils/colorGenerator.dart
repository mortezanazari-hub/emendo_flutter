import 'dart:ui';

import 'package:flutter/cupertino.dart';

final Color baseColor = Color(0xff9EDF9C);
final List<Color> colors = [
  Color(0xffF7FFF7),
  Color(0xffDDFFDF),
  Color(0xffC2FFC7),
  Color(0xff9EDF9C),
  Color(0xff526E48),
  Color(0xff30402A),
  Color(0xff0E120C),
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
