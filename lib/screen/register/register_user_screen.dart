import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/component/button/button_custom.dart';
import 'package:tikok_app_ver2/component/loading/loading_custom.dart';
import 'package:tikok_app_ver2/component/text_field/input_info_text_field.dart';
import 'package:tikok_app_ver2/screen/login/login_user_screen.dart';
import 'package:tikok_app_ver2/screen/register/register_user_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {

  final _formKey = GlobalKey<FormState>();

  RegisterUserController registerUserController =
      Get.put(RegisterUserController());

  @override
  void dispose() {
    registerUserController.emailTextEditingController.dispose();
    registerUserController.passwordTextEditingController.dispose();
    registerUserController.usernameTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/tiktok_logo.png",
                  width: 150,
                ),
        
                InputInfoTextField(
                  textEditingController: registerUserController.emailTextEditingController,
                  labelString: "Email",
                  iconData: Icons.email_outlined,
                  validator: (value) {
                      value = value?.trim();
                      if ( !GetUtils.isEmail(value ?? "")) {
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
                  textEditingController: registerUserController.passwordTextEditingController,
                  labelString: "Password",
                  iconData: Icons.lock_outlined,
                  isObscure: true,
                  validator: (value) => (value!.length <= 6) ? "Length must be greater than 6" : null
        
                ),

                const SizedBox(
                  height: 20,
                ),
        
                // password input
                InputInfoTextField(
                  textEditingController: registerUserController.usernameTextEditingController,
                  labelString: "Username",
                  iconData: Icons.account_circle,
                  validator: (v) => v!.length <= 3 ? "Length must be greater than 3" : null,
                ),
        
                const SizedBox(
                  height: 20,
                ),
        
                Obx(() {
                  return registerUserController.isRegistering.value
                      ? LoadingCustom.loadingLikeTiktok()
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ButtonCustom(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    registerUserController.register();
                                  }
                                },
                                content: 'Register',
                              ),
                            ),
                          ],
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
