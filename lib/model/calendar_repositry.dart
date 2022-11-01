import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../data/calendar_data.dart';

part 'calendar_repositry.g.dart';

@RestApi(baseUrl: "http://v.juhe.cn")
abstract class CalendarRepository{
  factory CalendarRepository(Dio dio, {String baseUrl}) = _CalendarRepository;
  @GET("/laohuangli/d?date=2022-9-25&key=a8f2732319cf0ad3cce8ec6ef7aa4f33")
  Future<CalendarData> getCalendar();
}