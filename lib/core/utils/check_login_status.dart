import 'package:emendo/features/auth_feature/presentation/pages/first_auth_screen.dart';
import 'package:emendo/features/home_feature/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckLoginStatus {
  Future<void> call(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final apiToken = prefs.getString('api_token');

    if (apiToken != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const FirstAuthScreen()));
    }
  }
}
