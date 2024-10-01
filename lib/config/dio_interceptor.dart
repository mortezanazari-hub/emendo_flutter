import 'package:dio/dio.dart';
import 'package:emendo/config/shared_oprator.dart';
import 'package:emendo/di.dart';

class DioInterceptor extends Interceptor {
  Dio dio;
  DioInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer ${locator<SharedPrefOperator>().getUserToken()}",
    });
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response,handler);
  }

}