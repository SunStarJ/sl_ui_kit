import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/base/base_scaffold.dart';
import 'package:sl_ui_kit/home/home_page.dart';
import 'package:sl_ui_kit/login/loggin_page.dart';
import 'package:sl_ui_kit/router.dart';
import 'package:sl_ui_kit/test.dart';
import 'package:sl_ui_kit/view_model/login_view_model.dart';
import 'package:sl_ui_kit/person/person_page.dart';
import 'package:sl_ui_kit/view_model/user_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserViewModel()),
    ],
    child: AppRouter(),
  ));
}

