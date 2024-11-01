import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/component/button/button_custom.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/screen/login/login_user_screen.dart';
import 'package:tikok_app_ver2/screen/register/register_user_screen.dart';

class CheckLogin extends StatelessWidget {
  final Widget child;
  DataAppController dataAppController = Get.find();

  CheckLogin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => dataAppController.isLogin.value == true
          ? child
          : Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "You are not logged in.",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ButtonCustom(
                        onPressed: () {
                          Get.to(() => const RegisterUserScreen());
                        },
                        content: 'Register',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonCustom(
                        onPressed: () {
                          Get.to(() => const LoginUserScreen());
                        },
                        content: 'Login',
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
