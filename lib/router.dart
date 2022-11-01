import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sl_ui_kit/home.dart';
import 'package:sl_ui_kit/home/home_page.dart';
import 'package:sl_ui_kit/login/loggin_page.dart';
import 'package:sl_ui_kit/refresh/refresh_and_load.dart';
import 'package:sl_ui_kit/refresh/refresh_and_load_grid.dart';

import 'barcode_scan/bar_code_scan_page.dart';

class AppRouter extends StatelessWidget {
  AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyRefresh.defaultHeaderBuilder = () => const MaterialHeader();
    EasyRefresh.defaultFooterBuilder = () => const ClassicFooter();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) =>
          MaterialApp.router(
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: const Color(0XFF0b8793),
              inputDecorationTheme: InputDecorationTheme(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 12.w, horizontal: 15.w),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0XFF0b8793)),
                      borderRadius: BorderRadius.circular(1000)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(1000))),
              appBarTheme: const AppBarTheme(color: Color(0XFF0b8793)),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1000)),
                      backgroundColor: const Color(0XFF0b8793),
                      textStyle: const TextStyle(color: Colors.white),
                      primary: Colors.white)),
              buttonTheme: ButtonThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                  textTheme: ButtonTextTheme.accent,
                  buttonColor: const Color(0XFF0b8793))),
          routerConfig: _goRoute,title: "",),
    ) ;
  }



  final GoRouter _goRoute = GoRouter(routes: [
    GoRoute(path: StaticPath.login, builder: (ctx, state) => LoginPage()),
    GoRoute(path: StaticPath.home, builder: (ctx, state) => MyHomePage()),
    GoRoute(path: StaticPath.qrScan, builder: (ctx, state) => BarCodeScanPage()),
    GoRoute(path: StaticPath.refreshList, builder: (ctx, state) => RefreshListPage()),
    GoRoute(path: StaticPath.refreshGrid, builder: (ctx, state) => RefreshGridPage()),
  ]);
}
class StaticPath {
  static const String login = "/";
  static const String home = "/home";
  static const String qrScan = "/qrscan";
  static const String refreshList = "/refresh/list";
  static const String refreshGrid = "/refresh/grid";
}
