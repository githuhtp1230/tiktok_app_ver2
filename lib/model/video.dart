import 'package:tikok_app_ver2/model/user.dart';

class Video {
  int? id;
  int? userId;
  String? artistSong;
  String? description;
  late int totalLikes;
  late int totalShares;
  late int totalComments;
  String? videoUrl;
  String? thumbnailUrl;
  String? createdAt;
  String? updatedAt;
  late bool isLiked;
  User? user;

  Video(
      {this.id,
        this.userId,
        this.artistSong,
        this.description,
        this.totalLikes = 0,
        this.totalShares= 0,
        this.totalComments = 0,
        this.videoUrl,
        this.thumbnailUrl,
        this.createdAt,
        this.updatedAt,
        this.isLiked = false,
        this.user});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    artistSong = json['artist_song'];
    description = json['description'];
    totalLikes = json['total_likes'] ?? 0;
    totalShares = json['total_shares'] ?? 0;
    totalComments = json['total_comments'] ?? 0;
    videoUrl = json['video_url'];
    thumbnailUrl = json['thumbnail_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isLiked = json['is_liked'] ?? false;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['artist_song'] = this.artistSong;
    data['description'] = this.description;
    data['total_likes'] = this.totalLikes;
    data['total_shares'] = this.totalShares;
    data['total_comments'] = this.totalComments;
    data['video_url'] = this.videoUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_liked'] = this.isLiked;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}