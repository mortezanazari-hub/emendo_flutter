import 'dart:convert';

import 'package:emendo/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String userKey = 'user_key';

  Future<void> saveUser(UserEntity user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(userKey, userJson);
  }

  Future<UserEntity?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(userKey);

    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserEntity.fromJson(userMap);
    }

    return null;
  }

  Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userKey);
  }
}