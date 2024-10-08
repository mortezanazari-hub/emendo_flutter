import 'dart:ui';

import 'package:emendo/core/utils/get_api_token.dart';

class AppConst {
  ///version:
  static const String appVersion = "ver: 0.1a";

  ///api provider
  static const String apiBase = "https://emendo.liara.run/api";

  static DateTime? lastOnlineDate;

  ///api_token
  static String? apiToken;

  static Future<void> initializeApiToken() async {
    apiToken = await GetApiToken.call();
  }

  static void apiTokenToNull() {
    apiToken = null;
  }

  ///screen size:
  static double screenWidth = 280;
  static double screenHeight = 720;

  ///padding size:
  static double standardPadding = screenWidth * 0.055;

  ///size
  static double standardButtonHeight = screenWidth * 0.12;
  static double standardTitleFontSize = screenWidth * 0.07;
  static double standardDescriptionFontSize = screenWidth * 0.03;

  ///colors:
  static const Color mainColor = Color(0xff479b2c);
  static const Color secondColor = Color(0xffffffff);
  static const Color disabledColor = Color(0xffbabfcd);
}
