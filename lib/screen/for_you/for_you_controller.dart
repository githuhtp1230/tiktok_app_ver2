import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tikok_app_ver2/const/const.dart';
import 'package:tikok_app_ver2/data/repository/repository_manager.dart';
import 'package:tikok_app_ver2/model/video.dart';
import 'package:tikok_app_ver2/screen/for_you/for_you_video.dart';
import 'package:video_player/video_player.dart';

import '../../component/alert/alert_custom.dart';

class ForYouController extends GetxController {
  PageController pageController = PageController();
  RxList<ForYouVideo> listForYouVideo = RxList<ForYouVideo>();

  Future<void> loadListVideo(int startIndex) async {
    try {
      var listVideo =
      await RepositoryManager.videoRepository.getListVideo(startIndex);
      if (listVideo != null) {
        for (var i in listVideo) {
          listForYouVideo.add(ForYouVideo(video: i));
        }
      }
    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
  }

  Future<void> handleLikeVideo(int idVideo, bool isLike) async {
    try {
      await RepositoryManager.videoRepository.handleLike(idVideo, isLike);
    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
  }

  void onPageChange(int index) {
    if (listForYouVideo.length - index == 2) {
      loadListVideo(listForYouVideo.length);
    }
  }

  void reloadPage() {
    listForYouVideo.clear();
    loadListVideo(0);
  }
}
