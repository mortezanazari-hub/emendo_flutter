import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
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
    if (apiToken != null) {
      _saveApiToken(apiToken);
    }

    //make login result to model and entity
    return LoginModel(
      success: success,
      data: data,
      apiToken: apiToken,
    );
  }

  static Future<void> _saveApiToken(String apiToken) async {
    final prefs = await SharedPreferences.getInstance();

    //add api_token to prefs
    await prefs.setString('api_token', apiToken);

    //add api token to AppConst.apiToken
    await AppConst.initializeApiToken();
  }
}
