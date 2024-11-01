import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tikok_app_ver2/component/image/build_avatar.dart';
import 'package:tikok_app_ver2/component/loading/loading_custom.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/model/comment.dart';
import 'package:tikok_app_ver2/model/video.dart';
import 'package:tikok_app_ver2/screen/comment/comment_controller.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/screen/comment/comment_item.dart';
import 'package:tikok_app_ver2/screen/login/login_user_screen.dart';
import 'package:tikok_app_ver2/utils/user_info.dart';

import '../../const/const.dart';

class CommentScreen extends StatefulWidget {
  final Video video;

  CommentScreen({super.key, required this.video});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  CommentController commentController = CommentController();

  Video get video => widget.video;

  @override
  void initState() {
    super.initState();
    commentController.init(video.id!);
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text("${video.totalComments} bình luận"),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  Obx(
                    () => SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return commentController.newListCommentItem[index];
                      },
                          childCount:
                              commentController.newListCommentItem.length),
                    ),
                  ),
                  PagedSliverList(
                    pagingController: commentController.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Comment>(
                      itemBuilder: (context, item, index) {
                        return CommentItem(comment: item);
                      },
                      newPageProgressIndicatorBuilder: (context) =>
                          LoadingCustom.loadingLikeTiktok(),
                      firstPageProgressIndicatorBuilder: (context) =>
                          LoadingCustom.loadingLikeTiktok(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.white12))),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Get.find<DataAppController>().isLogin.value
                  ? Row(
                      children: [
                        BuildAvatar(
                          avatarUrl:
                              "${DOMAIN}${Get.find<DataAppController>().currentUser.value.avatar}",
                          size: 35,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            controller:
                                commentController.contentTextEditingController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white12,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              labelText: "Nhập bình luận",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            commentController.postComment(video.id!);
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.pink,
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Text("Bạn cần đăng nhập để gửi bình luận"),
                        TextButton(
                          onPressed: () {
                            Get.to(() => LoginUserScreen());
                          },
                          child: Text("Đăng nhập"),
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
