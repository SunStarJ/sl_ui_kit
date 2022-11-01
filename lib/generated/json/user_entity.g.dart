import 'package:sl_ui_kit/generated/json/base/json_convert_content.dart';
import 'package:sl_ui_kit/data/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		userEntity.msg = msg;
	}
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		userEntity.code = code;
	}
	final UserData? data = jsonConvert.convert<UserData>(json['data']);
	if (data != null) {
		userEntity.data = data;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	data['data'] = entity.data?.toJson();
	return data;
}

UserData $UserDataFromJson(Map<String, dynamic> json) {
	final UserData userData = UserData();
	final String? nickName = jsonConvert.convert<String>(json['nickName']);
	if (nickName != null) {
		userData.nickName = nickName;
	}
	final String? headerImg = jsonConvert.convert<String>(json['headerImg']);
	if (headerImg != null) {
		userData.headerImg = headerImg;
	}
	return userData;
}

Map<String, dynamic> $UserDataToJson(UserData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['nickName'] = entity.nickName;
	data['headerImg'] = entity.headerImg;
	return data;
}