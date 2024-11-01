import '../../../../model/comment.dart';

class CommentListResponse {
  int? code;
  bool? success;
  Data? data;
  String? msgCode;
  String? msg;

  CommentListResponse(
      {this.code, this.success, this.data, this.msgCode, this.msg});

  CommentListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msgCode = json['msg_code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg_code'] = this.msgCode;
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  int? currentPage;
  List<Comment>? comments;
  String? nextPageUrl;

  Data({this.currentPage, this.comments, this.nextPageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      comments = <Comment>[];
      json['data'].forEach((v) {
        comments!.add(new Comment.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.comments != null) {
      data['data'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    return data;
  }
}
