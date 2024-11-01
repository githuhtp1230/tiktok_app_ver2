import '../../../../model/user.dart';
import '../../../../model/video.dart';

class ListVideoResponse {
  int? code;
  bool? success;
  List<Video>? data;
  String? msgCode;
  String? msg;

  ListVideoResponse(
      {this.code, this.success, this.data, this.msgCode, this.msg});

  ListVideoResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Video>[];
      json['data'].forEach((v) {
        data!.add(new Video.fromJson(v));
      });
    }
    msgCode = json['msg_code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg_code'] = this.msgCode;
    data['msg'] = this.msg;
    return data;
  }
}