import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikok_app_ver2/const/const_database_shared_preferences.dart';

class UserInfo {
  static final UserInfo _singleton = UserInfo._internal();

  String? _token;

  UserInfo._internal();

  factory UserInfo() {
    return _singleton;
  }

  Future<void> setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_TOKEN, token ?? "");
    _token = token;
  }

  Future<bool> hasLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenLocal = prefs.getString(USER_TOKEN) ?? "";
    if ( tokenLocal.isEmpty) {
      return false;
    }
    setToken(tokenLocal);
    _token = tokenLocal;
    return true;
  }

  String? getToken() {
    return _token;
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_TOKEN, "");
    _token = null;
  }
}