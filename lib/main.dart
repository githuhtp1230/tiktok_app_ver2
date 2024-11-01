import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/data/remote/service_manager.dart';
import 'package:tikok_app_ver2/splash_screen.dart';

void main() {
  ServiceManager.initialize();
  runApp(_MainWindowTiktok());
}

class _MainWindowTiktok extends StatefulWidget {
  const _MainWindowTiktok({super.key});

  @override
  State<_MainWindowTiktok> createState() => _MainWindowTiktokState();
}

class _MainWindowTiktokState extends State<_MainWindowTiktok> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Tiktok - app",
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: SplashScreen(),
    );
  }
}
