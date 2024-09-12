import 'package:shared_preferences/shared_preferences.dart';

class GetApiToken {
  static Future<String?> call() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('api_token');
  }
}
// class SetPrefs {
//   static Future<T> call(String) async{
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.
//   }
// }