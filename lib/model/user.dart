import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  User({
    this.id,
    this.email,
    this.name,
    this.avatar,
  });

  int? id;
  String? email;
  String? name;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "avatar": avatar,
  };
}
