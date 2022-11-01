import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/data/calendar_data.dart';
import 'package:sl_ui_kit/view_model/calendar_view_model.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalendarData? weatherData = context.watch<CalendarViewModel>().calendarData;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.w),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
          child: weatherData == null
              ? const Text("黄历数据加载中...")
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(weatherData.result?.yangli ?? "未知"),
                        Text(weatherData.result?.yinli ?? "未知")
                      ],
                    ),
                    Text("宜：${weatherData.result?.yi ?? ""}"),
                    SizedBox(
                      height: 10.w,
                    ),
                    Text("忌：${weatherData.result?.ji ?? ""}")
                  ],
                ),
        ),
      ),
    );
  }
}
