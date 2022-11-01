// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarData _$CalendarDataFromJson(Map<String, dynamic> json) => CalendarData(
      reason: json['reason'] as String?,
      result: json['result'] == null
          ? null
          : ResultBean.fromJson(json['result'] as Map<String, dynamic>),
      error_code: json['error_code'] as num?,
    );

Map<String, dynamic> _$CalendarDataToJson(CalendarData instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'result': instance.result,
      'error_code': instance.error_code,
    };

ResultBean _$ResultBeanFromJson(Map<String, dynamic> json) => ResultBean(
      id: json['id'] as String?,
      yangli: json['yangli'] as String?,
      yinli: json['yinli'] as String?,
      wuxing: json['wuxing'] as String?,
      chongsha: json['chongsha'] as String?,
      baiji: json['baiji'] as String?,
      jishen: json['jishen'] as String?,
      yi: json['yi'] as String?,
      xiongshen: json['xiongshen'] as String?,
      ji: json['ji'] as String?,
    );

Map<String, dynamic> _$ResultBeanToJson(ResultBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'yangli': instance.yangli,
      'yinli': instance.yinli,
      'wuxing': instance.wuxing,
      'chongsha': instance.chongsha,
      'baiji': instance.baiji,
      'jishen': instance.jishen,
      'yi': instance.yi,
      'xiongshen': instance.xiongshen,
      'ji': instance.ji,
    };
