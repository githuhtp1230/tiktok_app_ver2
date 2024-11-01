import 'package:tikok_app_ver2/model/user.dart';

class Comment {
  int? id;
  int? userId;
  int? videoId;
  String? content;
  int? totalLikes;
  bool? isLiked;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comment(
      {this.id,
        this.userId,
        this.videoId,
        this.content,
        this.totalLikes,
        this.isLiked,
        this.createdAt,
        this.updatedAt,
        this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    videoId = json['video_id'];
    content = json['content'];
    totalLikes = json['total_likes'];
    isLiked = json['is_liked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['video_id'] = this.videoId;
    data['content'] = this.content;
    data['total_likes'] = this.totalLikes;
    data['is_liked'] = this.isLiked;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}