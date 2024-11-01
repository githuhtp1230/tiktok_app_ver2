import 'package:get/get.dart';
import 'package:tikok_app_ver2/component/dialog/my_dialogs.dart';
import 'package:tikok_app_ver2/data/repository/repository_manager.dart';
import 'package:tikok_app_ver2/screen/login/login_user_screen.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';

import '../model/user.dart';

class DataAppController extends GetxController {
  var isLogin = false.obs;
  var currentUser = User().obs;

  Future<void> getCurrentUser() async {
    try {
      var data = await RepositoryManager.accountRepository.getCurrentUser();
      currentUser.value = data!.data!;
    } catch (err) {
      print("Error get user $err");
    }
  }

  Future<void> logout() async {
    try {
      var data = await RepositoryManager.accountRepository.logout();
      isLogin.value = false;
      currentUser.value = User();
      UserInfo().deleteToken();
    } catch (err) {
      print(err);
    }
  }

  Future<bool> checkSecurity() async {
    if ( isLogin.value == false ) {
      MyDialogs.showDialogYesNo(
        mess: "Do you want to login to use this service",
        onOK: () {
          Get.to(() => const LoginUserScreen());
        }
      );
      return false;
    }
    return true;
  }
}