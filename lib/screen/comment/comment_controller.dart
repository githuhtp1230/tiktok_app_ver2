import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tikok_app_ver2/component/alert/alert_custom.dart';
import 'package:tikok_app_ver2/const/custom_request.dart';
import 'package:tikok_app_ver2/data/repository/repository_manager.dart';
import 'package:tikok_app_ver2/model/comment.dart';
import 'package:tikok_app_ver2/screen/comment/comment_item.dart';

class CommentController extends GetxController {
  TextEditingController contentTextEditingController = TextEditingController();

  PagingController<int, Comment> pagingController = PagingController(firstPageKey: 1);

  RxList<Comment> listComment = RxList<Comment>();
  RxList<CommentItem> newListCommentItem = RxList<CommentItem>();

  void init(int idVideo) {
    pagingController.addPageRequestListener((page) async {
      var data = await RepositoryManager.commentRepository.getListComment(idVideo, PAGE_SIZE_COMMENT, page);
      bool isLastPage = data!.data!.nextPageUrl == null;

      if ( isLastPage ) {
        pagingController.appendLastPage(data.data!.comments!);
      }
      else {
        pagingController.appendPage(data.data!.comments!, page + 1);
      }
    });
  }

  Future<void> handleLike(int idComment, bool likeStatus) async {
    try {
      await RepositoryManager.commentRepository.handleLike(idComment, likeStatus);
    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
  }

  Future<void> postComment(int idVideo) async {
    try {
      var data = await RepositoryManager.commentRepository.postComment(idVideo, contentTextEditingController.text);
      newListCommentItem.insert(0, CommentItem(comment: data!.data!));
      AlertCustom.showSuccess(message: "Bình luận thành công");
    } catch (err) {
      AlertCustom.showError(message: err.toString());
    }
  }
}