class LoginResponse {
  int? code;
  bool? success;
  DataLogin? data;
  String? msgCode;
  String? msg;

  LoginResponse({this.code, this.success, this.data, this.msgCode, this.msg});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    data = json['data'] != null ? new DataLogin.fromJson(json['data']) : null;
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

class DataLogin {
  String? token;
  String? refreshToken;
  String? tokenExpired;
  String? refreshTokenExpired;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataLogin(
      {this.token,
        this.refreshToken,
        this.tokenExpired,
        this.refreshTokenExpired,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.id});

  DataLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refresh_token'];
    tokenExpired = json['token_expired'];
    refreshTokenExpired = json['refresh_token_expired'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['token_expired'] = this.tokenExpired;
    data['refresh_token_expired'] = this.refreshTokenExpired;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
