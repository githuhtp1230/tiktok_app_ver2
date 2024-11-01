import 'package:tikok_app_ver2/data/remote/response_request/auth/login_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/success/success_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/users/user_response.dart';
import 'package:tikok_app_ver2/data/remote/service_manager.dart';
import 'package:tikok_app_ver2/data/repository/handle_error.dart';
import 'package:tikok_app_ver2/model/user.dart';

class AccountRepository {
  Future<UserResponse?> getCurrentUser() async {
    try {
      var res = await ServiceManager().service!.getCurrentUser();
      return res;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

  Future<User?> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
        "email": email,
        "password": password
      };
      var res = await ServiceManager().service!.register(body);
      return res.data;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

  Future<DataLogin?> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> body = {"email": email, "password": password};
      var res = await ServiceManager().service!.login(body);
      return res.data;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

  Future<SuccessResponse?> logout() async {
    try {
      var res = await ServiceManager().service!.logout();
      return res;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

}
