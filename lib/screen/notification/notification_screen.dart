import 'package:flutter/material.dart';
import 'package:tikok_app_ver2/component/widget/check_login.dart';

class NotificationLockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckLogin(child: NotificationScreen());
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Notification Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
