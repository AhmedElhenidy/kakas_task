import 'dart:convert';

import '../../../../app/error/exceptions.dart';

class UserModel {
  UserModel({
      this.token,
  });

  factory UserModel.fromJson(String source) {
    try {
      return UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }
  UserModel.fromMap(dynamic json) {
    token = json['token'];
    id = json['id'];
    username = json['username'];
  }
  String? token;
  num? id;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    return map;
  }
}