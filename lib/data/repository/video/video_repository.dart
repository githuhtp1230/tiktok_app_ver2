import 'package:tikok_app_ver2/data/remote/response_request/success/success_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/videos/list_video_response.dart';
import 'package:tikok_app_ver2/const/custom_request.dart';
import 'package:tikok_app_ver2/data/remote/service_manager.dart';
import 'package:tikok_app_ver2/data/repository/handle_error.dart';
import 'package:tikok_app_ver2/model/video.dart';

class VideoRepository {
  Future<List<Video>?> getListVideo(int startIndex) async {
    try {
      var res = await ServiceManager().service!.getListVideo(startIndex, LIMIT_VIDEO);
      return res.data;
    } catch (err) {
      handleError(err);
    }
    return null;
  }

  Future<SuccessResponse?> handleLike(int idVideo, bool isLike) async {
    try {
      Map<String, dynamic> body = {
        "is_like": isLike,
      };
      var res = await ServiceManager().service!.handleLikeVideo(idVideo, body);
      return res;
    } catch (err) {
      handleError(err);
    }
    return null;
  }
}