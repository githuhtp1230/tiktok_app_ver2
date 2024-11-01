import 'package:tikok_app_ver2/data/remote/response_request/comments/comment_list_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/comments/comment_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/success/success_response.dart';
import 'package:tikok_app_ver2/model/comment.dart';

import '../../remote/service_manager.dart';
import '../handle_error.dart';

class CommentRepository {
  Future<CommentListResponse?> getListComment(int idVideo, int pageSize, int page) async {
    try {
      var res = await ServiceManager().service!.getListComment(idVideo, pageSize, page);
      return res;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

  Future<SuccessResponse?> handleLike(int idComment, bool likeStatus) async {
    try {
      Map<String, dynamic> body = {
        "is_like": likeStatus
      };
      var res = await ServiceManager().service!.handleLikeComment(idComment, body);
      return res;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

  Future<CommentResponse?> postComment(int idVideo, String content) async {
    try {
      Map<String, dynamic> body = {
        "content": content
      };
      var res = await ServiceManager().service!.postComment(idVideo, body);
      return res;
    } catch (err) {
      handleError(err);
    }
    return null;
  }
}