import 'package:dio/dio.dart';
import 'package:emendo/Common/param/login_param.dart';
import 'package:emendo/Common/param/register_param.dart';


class AuthApiProvider {
  Dio dio;
  AuthApiProvider(this.dio);

  callLogin (LoginParam loginParam) async{
    Response response = await dio.post(
        '/login',
        queryParameters: {
          'email' :loginParam.email,
          'password':loginParam.password,
        }
    );
    return response;
  }

  callRegister(RegisterParam registerParam) async {
    var response = await dio.post("/register", queryParameters: {
      "name": registerParam.name,
      "email": registerParam.email,
      "password": registerParam.password,
    });
    return response;
  }

  callValidationEmail(String code) async {
    var response = await dio.post("/verify", queryParameters: {
      'code': code,
    });
    return response;
  }
}