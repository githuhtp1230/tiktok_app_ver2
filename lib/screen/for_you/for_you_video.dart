import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tikok_app_ver2/component/image/build_avatar.dart';
import 'package:tikok_app_ver2/const/const.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/model/video.dart';
import 'package:tikok_app_ver2/screen/comment/comment_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

import 'for_you_controller.dart';

class ForYouVideo extends StatefulWidget {
  Video video;

  ForYouVideo(
      {super.key, required this.video});

  @override
  State<ForYouVideo> createState() => _ForYouVideoState();
}

class _ForYouVideoState extends State<ForYouVideo> {
  late VideoPlayerController videoPlayerController;

  ForYouController forYouController = ForYouController();
  DataAppController dataAppController = Get.find();

  RxInt totalLikes = 0.obs;
  RxInt totalComments = 0.obs;
  RxBool isLiked = false.obs;

  Video get video => widget.video;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse("${DOMAIN}${video.videoUrl}"));
    videoPlayerController.initialize().then((_) {
      setState(() {});
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
    });

    totalLikes.value = video.totalLikes;
    totalComments.value = video.totalComments;
    isLiked.value = video.isLiked;
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(videoPlayerController),
        Column(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${video.user?.name}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${video.description}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.music_note,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text(
                                "${video.artistSong}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: BuildAvatar(
                            avatarUrl: "${DOMAIN}${video.user?.avatar}",
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () async {
                                if (await dataAppController.checkSecurity()) {
                                  if (isLiked.value) {
                                    isLiked.value = false;
                                    video.isLiked = false;
                                    totalLikes.value--;
                                    video.totalLikes--;
                                  } else {
                                    isLiked.value = true;
                                    video.isLiked = true;
                                    totalLikes.value++;
                                    video.totalLikes++;
                                  }
                                  forYouController.handleLikeVideo(video.id!,
                                      isLiked.value);
                                }
                              },
                              child: Obx(
                                () => Icon(
                                  Icons.favorite,
                                  size: 40,
                                  color: isLiked.value
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                "${totalLikes.value}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                showMaterialModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) => SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: CommentScreen(
                                      video: video,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.comment,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${totalComments.value}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
