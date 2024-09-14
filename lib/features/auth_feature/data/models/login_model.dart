import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/utils/user_preferences.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth_feature/data/repository/user_repository_impl.dart';
import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/user_repository.dart';
import 'package:emendo/features/auth_feature/domain/use_cases/get_user_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    //add result to login entity
    required super.success,
    required super.data,
    super.apiToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final apiToken = json['meta']['api_token'];
    final data = json['data'];
    final success = json['success'];

    //make api token to a local variable
    _saveApiToken(apiToken);

    //save userEntity to prefs
    _saveUserEntity(apiToken);


    //make login result to model and entity
    return LoginModel(
      success: success,
      data: data,
      apiToken: apiToken,
    );
  }

  factory LoginModel.fromJsonError(
      {Map<String, dynamic>? json, String? error}) {
    const apiToken = null;
    final data = json != null ? json['message'] : error;
    const success = false;

    //make login result to model and entity
    return LoginModel(
      success: success,
      data: data,
      apiToken: apiToken,
    );
  }

  static Future<void> _saveUserEntity(String apiToken) async {
    GetUserUseCase getUserUseCase = GetUserUseCase(locator());
    var userEntity = await getUserUseCase(apiToken);
    UserPreferences.saveUser(userEntity);

    if (kDebugMode) {
      print("userEntity saved to sharedPreferences");
    }
  }

  static Future<void> _saveApiToken(String apiToken) async {
    final prefs = await SharedPreferences.getInstance();

    //add api_token to prefs
    await prefs.setString('api_token', apiToken);

    //add api token to AppConst.apiToken
    await AppConst.initializeApiToken();
  }
}
