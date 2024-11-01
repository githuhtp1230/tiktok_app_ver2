import 'package:flutter/material.dart';
import 'package:tikok_app_ver2/const/const.dart';
import 'package:tikok_app_ver2/screen/for_you/for_you_controller.dart';
import 'package:tikok_app_ver2/screen/for_you/for_you_video.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../model/video.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForyouScreenState();
}

class _ForyouScreenState extends State<ForYouScreen> {
  ForYouController forYouController = Get.put(ForYouController());

  @override
  void initState() {
    super.initState();
    forYouController.loadListVideo(0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageView.builder(
          controller: forYouController.pageController,
          itemBuilder: (context, index) {
            return forYouController.listForYouVideo[index];
          },
          itemCount: forYouController.listForYouVideo.length,
          scrollDirection: Axis.vertical,
          onPageChanged: forYouController.onPageChange
        ),
      ),
    );
  }
}
