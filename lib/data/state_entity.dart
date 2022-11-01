import 'package:sl_ui_kit/generated/json/base/json_field.dart';
import 'package:sl_ui_kit/generated/json/state_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class StateEntity {

	String? msg;
	int? code;
	dynamic data;
  
  StateEntity();

  factory StateEntity.fromJson(Map<String, dynamic> json) => $StateEntityFromJson(json);

  Map<String, dynamic> toJson() => $StateEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}