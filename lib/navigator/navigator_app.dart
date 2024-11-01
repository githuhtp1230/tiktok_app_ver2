import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/component/icon_button/upload_video_custom_icon.dart';
import 'package:tikok_app_ver2/navigator/navigator_app_controller.dart';
import 'package:tikok_app_ver2/screen/for_you/for_you_screen.dart';
import 'package:tikok_app_ver2/screen/notification/notification_screen.dart';
import 'package:tikok_app_ver2/screen/profile/profile_screen.dart';
import 'package:tikok_app_ver2/screen/search/search_screen.dart';
import 'package:tikok_app_ver2/screen/upload_video/upload_video_screen.dart';

class NavigatorApp extends StatefulWidget {
  const NavigatorApp({super.key});

  @override
  State<NavigatorApp> createState() => _NavigatorState();
}

class _NavigatorState extends State<NavigatorApp> {
  final navigatorController = Get.put(NavigatorAppController());

  final List<Widget> pages = [
    ForYouScreen(),
    SearchScreen(),
    UploadVideoLockScreen(),
    NotificationLockScreen(),
    ProfileLockScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: navigatorController.selectedIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navigatorController.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: navigatorController.selectedIndex.value == 0 ? Colors.white : Colors.black,
          unselectedItemColor: navigatorController.selectedIndex.value == 0 ? Colors.grey : Colors.grey,
          backgroundColor: navigatorController.selectedIndex.value == 0 ? Colors.black : Colors.white,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Foryou"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: "Search"),
            BottomNavigationBarItem(icon: UploadCustomIcon(), label: ""),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.email_outlined,
                  size: 30,
                ),
                label: "Notification"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "Profile"),
          ],
          onTap: navigatorController.changeIndexTab,
        ),
      ),
    );
  }
}
