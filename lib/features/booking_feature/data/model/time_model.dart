import 'package:easy_localization/easy_localization.dart';

class TimeModel {
  TimeModel({
      this.time,});

  TimeModel.fromJson(dynamic json) {
    time =json['time'].toString().substring(0,5);
  }
  String? time;

}