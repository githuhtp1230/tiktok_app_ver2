import 'package:tikok_app_ver2/model/comment.dart';

class CommentResponse {
  int? code;
  bool? success;
  Comment? data;
  String? msgCode;
  String? msg;

  CommentResponse({this.code, this.success, this.data, this.msgCode, this.msg});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? new Comment.fromJson(json['data']) : null;
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