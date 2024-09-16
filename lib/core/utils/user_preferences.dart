import 'dart:convert';

import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String userKey = 'user_key';
  static const String apiToken = 'api_token';

 static Future<void> saveUser(UserEntity user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(userKey, userJson);
  }

  static Future<UserEntity?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(userKey);

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserEntity.fromJson(userMap);
    }

    return null;
  }

 static Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    AppConst.apiToken =null;
    await prefs.remove(apiToken);
    await prefs.remove(userKey);
  }
}