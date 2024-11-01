import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/navigator/navigator_app.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<SplashScreen> {

  DataAppController dataAppController = Get.put(DataAppController());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(
        const Duration(seconds: 1),
        () {
          checkLogin();
        },
      ),
    );
  }

  Future<void> checkLogin() async {
    if ( await UserInfo().hasLogged() ) {
      dataAppController.isLogin.value = true;
      await dataAppController.getCurrentUser();
      print(await UserInfo().getToken());
    }
    else {
      dataAppController.isLogin.value = false;
    }
    Get.offAll(() => NavigatorApp());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/tiktok_logo.png',
        fit: BoxFit.cover,
        height: 250,
      ),
    );
  }
}
