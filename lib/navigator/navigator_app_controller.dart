import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/for_you/for_you_controller.dart';

class NavigatorAppController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndexTab(int index) {
    if ( index == 0 && selectedIndex.value == 0 ) {
      Get.find<ForYouController>().reloadPage();
    }
    selectedIndex.value = index;
  }
}