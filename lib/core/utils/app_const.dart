import 'dart:ui';

import 'package:emendo/core/utils/get_api_token.dart';

class AppConst {
  ///version:
  static const String appVersion = "0.1.0";

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

  ///font size adder
  static double plusFontSize = 0;

  ///colors:
  static const Color mainColor = Color(0xff479b2c);
  static const Color secondColor = Color(0xffffffff);
  static const Color disabledColor = Color(0xffbabfcd);
  static const Color indigoColor = Color(0xFF1C2135);

  static const Color color0 = Color(0xffFFFFFF);
  static const Color color1 = Color(0xFFFAFFFA);
  static const Color color2 = Color(0xFFE9F9E9);
  static const Color color3 = Color(0xFFD7F3D7);
  static const Color color4 = Color(0xFFB8E7A9);
  static const Color color5 = Color(0xFF637D5B);
  static const Color color6 = Color(0xFF637D5B);
  static const Color color7 = Color(0xFF394834);
  static const Color color8 = Color(0xFF0E120C);

  ///Language
  static List<String> languageOptions = [
    "English",
    "Persian",
    "Arabic",
    "Russian",
    "Spanish",
    "Chinese",
    "French",
    "German",
    "Japanese",
    "Hindi",
    "Portuguese",
    "Italian",
    "Korean",
    "Turkish",
    "Dutch",
    "Swedish",
    "Greek",
    "Thai",
    "Vietnamese",
    "Indonesian",
    "Polish",
    "Ukrainian",
    "Hebrew",
    "Czech",
    "Hungarian"
  ];

  ///colorScheme
  static List<String> colorSchemeOptions = [
    "Default",
    "Blue",
    "Red",
    "Yellow",
    "Browne",
    "Cyan",
    "Orange",
    "Purple",
    "Pink",
  ];

  ///Font list
  static List<String> fontSelectOptions = [
    "NauticaRounded",
    "Roboto",
    "Open Sans",
    "Lato",
    "Montserrat",
    "Poppins",
    "Arial",
    "Helvetica",
    "Times New Roman",
    "Verdana",
    "Georgia",
  ];
}
