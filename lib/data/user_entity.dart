import 'package:sl_ui_kit/generated/json/base/json_field.dart';
import 'package:sl_ui_kit/generated/json/user_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserEntity {

	String? msg;
	int? code;
	UserData? data;
  
  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserData {

	String? nickName;
	String? headerImg;
  
  UserData();

  factory UserData.fromJson(Map<String, dynamic> json) => $UserDataFromJson(json);

  Map<String, dynamic> toJson() => $UserDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}