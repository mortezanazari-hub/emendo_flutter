import 'package:dio/dio.dart';
import 'package:emendo/features/auth_feature/data/api_provider/api_provider.dart';
import 'package:emendo/features/auth_feature/data/models/login_model.dart';
import 'package:emendo/features/auth_feature/domain/entities/login_entity.dart';
import 'package:emendo/features/auth_feature/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiProvider apiProvider;

  LoginRepositoryImpl(this.apiProvider);

  @override
  Future<LoginEntity> login(String email, String password) async {
    //send
    try {
      final response = await apiProvider.post(
        "/login",
        queryParameters: {
          'email': email,
          'password': password,
        },
      );
     if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return LoginModel.fromJsonError(error: "morteza");
      }
    } on DioException catch (e){
      if(e.response?.statusCode == 404 || e.response?.statusCode == 422) {
        return LoginModel.fromJsonError(json: e.response?.data);
      }
        return LoginModel.fromJsonError(error: e.toString());
    }
  }
}
