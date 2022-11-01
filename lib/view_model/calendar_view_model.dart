import 'package:flutter/material.dart';
import 'package:sl_ui_kit/data/calendar_data.dart';
import 'package:sl_ui_kit/instance/dio_instance.dart';
import 'package:sl_ui_kit/model/calendar_repositry.dart';

class CalendarViewModel extends ChangeNotifier {
  CalendarData? calendarData;

  Future getWeatherData() async {
    calendarData = await CalendarRepository(DioInstance.getInstance().dio).getCalendar();
    notifyListeners();
  }
}
