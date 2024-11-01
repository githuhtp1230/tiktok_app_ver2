import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tikok_app_ver2/controller/date_app_controller.dart';
import 'package:tikok_app_ver2/model/comment.dart';
import 'package:get/get.dart';
import 'package:tikok_app_ver2/screen/comment/comment_controller.dart';

class CommentItem extends StatefulWidget {
  Comment comment;

  CommentItem({super.key, required this.comment});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  DataAppController dataAppController = Get.find();
  CommentController commentController = CommentController();

  Comment get comment => widget.comment;

  RxBool isLiked = false.obs;
  RxInt totalLikes = 0.obs;

  @override
  void initState() {
    super.initState();
    totalLikes.value = comment.totalLikes!;
    isLiked.value = comment.isLiked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                "${comment.user?.avatar}",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/user_default.png",
                      width: 50, height: 50, fit: BoxFit.cover);
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${comment.user?.name}",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "${comment.content}",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${comment.createdAt}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Obx(
                            () => Icon(
                              isLiked.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isLiked.value ? Colors.red : Colors.grey,
                            ),
                          ),
                          onTap: () async {
                            if ( await dataAppController.checkSecurity() ) {
                              if ( isLiked.value ) {
                                isLiked.value = false;
                                totalLikes--;
                              }
                              else {
                                isLiked.value = true;
                                totalLikes++;
                              }
                              commentController.handleLike(comment.id!, isLiked.value);
                            }
                          },
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Obx(
                          () => Text(
                            "${totalLikes.value}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        // SizedBox(
                        //   width: 20,
                        // )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
