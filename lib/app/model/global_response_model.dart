import 'dart:convert';

import '../../app/error/exceptions.dart';

class GlobalResponseModel {
  GlobalResponseModel({
    this.success,
    this.data,
    this.authError,
    this.key,
    this.msg,});

  factory GlobalResponseModel.fromJson(String source) {
    try {
      return GlobalResponseModel.fromMap(json.decode(source));
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }
  GlobalResponseModel.fromMap(dynamic json) {
    data = json;
  }
  bool? success;
  bool? authError;
  dynamic data;
  String? msg;
  String? key;

}