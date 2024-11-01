import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tikok_app_ver2/component/loading/loading_custom.dart';
import 'package:tikok_app_ver2/screen/login/login_user_controller.dart';
import 'package:tikok_app_ver2/screen/register/register_user_screen.dart';

import '../../component/button/button_custom.dart';
import '../../component/text_field/input_info_text_field.dart';

class LoginUserScreen extends StatefulWidget {
  const LoginUserScreen({super.key});

  @override
  State<LoginUserScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginUserScreen> {
  LoginUserController loginUserController = Get.put(LoginUserController());

  @override
  void dispose() {
    loginUserController.emailTextEditingController.dispose();
    loginUserController.passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/tiktok_logo.png",
                width: 150,
              ),

              InputInfoTextField(
                textEditingController:
                    loginUserController.emailTextEditingController,
                labelString: "Email",
                iconData: Icons.email_outlined,
                validator: (value) {
                  value = value?.trim();
                  if (!GetUtils.isEmail(value ?? "")) {
                    return "Invalid email";
                  }
                  return null;
                },
                // validator: ,
              ),
              const SizedBox(
                height: 10,
              ),

              // password input
              InputInfoTextField(
                  textEditingController:
                      loginUserController.passwordTextEditingController,
                  labelString: "Password",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                  validator: (value) => (value!.length <= 6)
                      ? "Length must be greater than 6"
                      : null),

              const SizedBox(
                height: 20,
              ),

              Obx(
                () {
                  return loginUserController.isLoggingIn.value
                      ? LoadingCustom.loadingLikeTiktok()
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ButtonCustom(
                                onPressed: () {
                                  loginUserController.login();
                                },
                                content: 'Login',
                              ),
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  "You have had an account?",
                                  style: TextStyle(fontSize: 17),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => RegisterUserScreen());
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
