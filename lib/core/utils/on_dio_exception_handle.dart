import 'package:dio/dio.dart';

class OnDioExceptionHandle {
  final DioException exception;

  OnDioExceptionHandle(this.exception);

  void call() {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        print("Connection timeout");
        break;

      case DioExceptionType.sendTimeout:
        print("Send timeout");
        break;

      case DioExceptionType.receiveTimeout:
        print("Receive timeout");
        break;

      case DioExceptionType.badCertificate:
        print("Bad certificate");
        break;

      case DioExceptionType.badResponse:
        print("Bad response: ${exception.response?.statusCode}");
        break;

      case DioExceptionType.cancel:
        print("Request was cancelled");
        break;

      case DioExceptionType.connectionError:
        print("Connection error: ${exception.message}");
        break;

      case DioExceptionType.unknown:
        print("Unknown error: ${exception.message}");
        break;

      default:
        print("Something went wrong");
        break;
    }
  }
}