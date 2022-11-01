// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_repositry.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CalendarRepository implements CalendarRepository {
  _CalendarRepository(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://v.juhe.cn';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CalendarData> getCalendar() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CalendarData>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            '/laohuangli/d?date=2022-9-25&key=a8f2732319cf0ad3cce8ec6ef7aa4f33',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CalendarData.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
