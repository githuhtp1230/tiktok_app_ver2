import 'package:flutter/material.dart';
import 'package:tikok_app_ver2/component/widget/check_login.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';
import 'package:get/get.dart';

class ProfileLockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckLogin(child: ProfileScreen());
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DataAppController dataAppController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Đặt tiêu đề ở giữa
        backgroundColor: Colors.black,
        title: Text("${dataAppController.currentUser.value.name}"),
        actions: [
          IconButton(
            onPressed: () {
              dataAppController.logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
