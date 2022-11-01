import 'package:json_annotation/json_annotation.dart';

part 'calendar_data.g.dart';

@JsonSerializable()
class CalendarData {
  String? reason;
  ResultBean? result;
  num? error_code;

  CalendarData({this.reason, this.result, this.error_code});

  factory CalendarData.fromJson(Map<String, dynamic> json) => _$CalendarDataFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarDataToJson(this);
}

@JsonSerializable()
class ResultBean {
  String? id;
  String? yangli;
  String? yinli;
  String? wuxing;
  String? chongsha;
  String? baiji;
  String? jishen;
  String? yi;
  String? xiongshen;
  String? ji;

  ResultBean({this.id, this.yangli, this.yinli, this.wuxing, this.chongsha, this.baiji, this.jishen, this.yi, this.xiongshen, this.ji});

  factory ResultBean.fromJson(Map<String, dynamic> json) => _$ResultBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ResultBeanToJson(this);
}

