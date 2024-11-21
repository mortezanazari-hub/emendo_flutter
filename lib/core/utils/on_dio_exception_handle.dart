import 'package:dio/dio.dart';

class OnDioExceptionHandle {
  final DioException exception;

  OnDioExceptionHandle(this.exception);

  void call() {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        break;

      case DioExceptionType.sendTimeout:
        break;

      case DioExceptionType.receiveTimeout:
        break;

      case DioExceptionType.badCertificate:
        break;

      case DioExceptionType.badResponse:
        break;

      case DioExceptionType.cancel:
        break;

      case DioExceptionType.connectionError:
        break;

      case DioExceptionType.unknown:
        break;

      default:
        break;
    }
  }
}
