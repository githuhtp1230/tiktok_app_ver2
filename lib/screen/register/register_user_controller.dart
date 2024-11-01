import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/component/alert/alert_custom.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/data/remote/response_request/auth/login_response.dart';
import 'package:tikok_app_ver2/data/repository/repository_manager.dart';
import 'package:tikok_app_ver2/model/user.dart';
import 'package:tikok_app_ver2/navigator/navigator_app.dart';
import 'package:tikok_app_ver2/screen/login/login_user_controller.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';

class RegisterUserController extends GetxController{
  RxBool isRegistering = false.obs;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController usernameTextEditingController = TextEditingController();

  DataAppController dataAppController = Get.find();

  Future<void> register() async {
    isRegistering.value = true;
    String email = emailTextEditingController.text;
    String password = passwordTextEditingController.text;
    try {
      User? userRegister = await RepositoryManager.accountRepository.register(
          name: usernameTextEditingController.text,
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text
      );
      isRegistering.value = false;
      if ( userRegister != null ) {
        login(email: email, password: password);
        AlertCustom.showSuccess(message: "Register successfully");
      }
    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
    isRegistering.value = false;
  }

  Future<void> login({required String email, required String password}) async {
    try {
      DataLogin? dataLogin = await RepositoryManager.accountRepository.login(email: email, password: password);

      await UserInfo().setToken(dataLogin!.token);
      await dataAppController.getCurrentUser();
      dataAppController.isLogin.value = true;

      Get.offAll(() => NavigatorApp());
    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
  }
}