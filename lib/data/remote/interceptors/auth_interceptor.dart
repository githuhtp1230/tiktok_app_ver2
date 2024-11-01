import 'package:dio/dio.dart';
import 'package:tikok_app_ver2/model/user.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.putIfAbsent("user-token", () => UserInfo().getToken());
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(err.message);
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.data);
    super.onResponse(response, handler);
  }
}