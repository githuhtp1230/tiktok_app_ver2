import 'package:dio/dio.dart';

void handleError(err) {
  if ( err is DioException ) {
    if ( err.response != null ) {
      final msgCode = err.response!.data["msg"];
      throw msgCode;
    }
    else {
      throw err.toString();
    }
  }
}