import '../../../../model/user.dart';

class UserResponse {
  UserResponse({
    this.code,
    this.success,
    this.data,
    this.msgCode,
    this.msg,
  });

  int? code;
  bool? success;
  User? data;
  String? msgCode;
  String? msg;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    code: json["code"] == null ? null : json["code"],
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : User.fromJson(json["data"]),
    msgCode: json["msg_code"] == null ? null : json["msg_code"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "success": success == null ? null : success,
    "data": data == null ? null : data!.toJson(),
    "msg_code": msgCode == null ? null : msgCode,
    "msg": msg == null ? null : msg,
  };
}