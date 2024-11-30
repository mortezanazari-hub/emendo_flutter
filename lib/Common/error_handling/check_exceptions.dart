import 'package:dio/dio.dart';
import 'data_state.dart';

class CheckExceptions {
  CheckExceptions(Object? error);

  static Future<DataFailed> response(Response? response) async {
    switch (response?.statusCode ?? -1) {
      case 400:
        return DataFailed(response?.data['message'] ?? "Data was wrong");
      case 404:
        return const DataFailed("Not Found");
      case 401:
        return DataFailed(response?.data['message'] ?? "Please Login again");
      case 422:
        return DataFailed(response?.data["message"] ?? "The Email Has Already Taken");
      case 500:
        return const DataFailed("Server is Not Responding,");
      default:
        if (response != null) {
          return DataFailed(
              response.data['message'] ?? "Please check your connection");
        } else {
          return const DataFailed("Please check your connection");
        }
    }
  }

  static Future<DataState> getError(Object error) async {
    if (error is DioException) {
      return response(error.response);
    } else {
      return const DataFailed("There is an Error");
    }
  }
}
