import 'package:dio/dio.dart';
import 'package:emendo/core/utils/app_const.dart';

class ApiProvider {
  late final Dio dio;

  ApiProvider() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConst.apiBase,
      ),
    );
  }

  Future<Response> get(String url, {Map<String, dynamic>? headers}) async {
    final options = Options(headers: headers);
    return await dio.get(url, options: options);
  }

  Future<Response> post(String url, {required Map<String, dynamic> data, Map<String, dynamic>? headers}) async {
    final options = Options(headers: headers);
    return await dio.post(url, data: data, options: options);
  }
}