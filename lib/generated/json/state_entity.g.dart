import 'package:sl_ui_kit/generated/json/base/json_convert_content.dart';
import 'package:sl_ui_kit/data/state_entity.dart';

StateEntity $StateEntityFromJson(Map<String, dynamic> json) {
	final StateEntity stateEntity = StateEntity();
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		stateEntity.msg = msg;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		stateEntity.code = code;
	}
	final dynamic? data = jsonConvert.convert<dynamic>(json['data']);
	if (data != null) {
		stateEntity.data = data;
	}
	return stateEntity;
}

Map<String, dynamic> $StateEntityToJson(StateEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['data'] = entity.data;
	return data;
}