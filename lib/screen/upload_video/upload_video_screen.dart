import 'package:flutter/material.dart';
import 'package:tikok_app_ver2/component/widget/check_login.dart';

class UploadVideoLockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CheckLogin(child: UploadVideoScreen());
  }
}

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Upload Video Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
