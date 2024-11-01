import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tikok_app_ver2/const/const.dart';
import 'package:tikok_app_ver2/data/remote/response_request/auth/login_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/comments/comment_list_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/comments/comment_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/success/success_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/users/user_response.dart';
import 'package:tikok_app_ver2/data/remote/response_request/videos/list_video_response.dart';
import 'package:tikok_app_ver2/model/user.dart';

part 'service.g.dart';

@RestApi(baseUrl: DOMAIN)
abstract class Service {
  factory Service(Dio dio, {String? baseUrl}) =>
      _Service(dio, baseUrl: baseUrl);

  @GET("api/users/me")
  Future<UserResponse> getCurrentUser();

  @POST("api/users/register")
  Future<UserResponse> register(@Body() Map<String, dynamic> body);

  @POST("api/users/login")
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST("api/users/logout")
  Future<SuccessResponse> logout();

  @GET("api/videos")
  Future<ListVideoResponse> getListVideo(
      @Query("start_index") int startIndex, @Query("limit") int limit);
  
  @POST("api/videos/{idVideo}/handle-like")
  Future<SuccessResponse> handleLikeVideo(@Path("idVideo") int idVideo, @Body() Map<String, dynamic> body);
  
  @GET("api/videos/{idVideo}/comments")
  Future<CommentListResponse> getListComment(@Path("idVideo") int idVideo, @Query("page_size") int pageSize, @Query("page") int page);

  @POST("api/comments/{idComment}/handle-like")
  Future<SuccessResponse> handleLikeComment(@Path("idComment") int idComment, @Body() Map<String, dynamic> body);

  @POST("api/videos/{idVideo}/comments")
  Future<CommentResponse> postComment(@Path("idVideo") int idVideo ,@Body() Map<String, dynamic> body);
}
