import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/component/alert/alert_custom.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/data/repository/repository_manager.dart';
import 'package:tikok_app_ver2/navigator/navigator_app.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';

class LoginUserController {
  RxBool isLoggingIn = false.obs;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  DataAppController dataAppController = Get.find();

  Future<void> login() async {
    isLoggingIn.value = true;
    try {
      String email = emailTextEditingController.text;
      String password = passwordTextEditingController.text;
      var res = await RepositoryManager.accountRepository.login(email: email, password: password);
      await UserInfo().setToken(res!.token);
      await dataAppController.getCurrentUser();
      dataAppController.isLogin.value = true;
      Get.offAll(() => NavigatorApp());

    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
    isLoggingIn.value = false;
  }
}