import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sl_ui_kit/person/person_page.dart';

import 'base/base_scaffold.dart';
import 'home/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [const HomePage(), const PersonPage()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      pageChange: (index) {
        setState(() {
          this.index = index;
        });
      },
      bottomBarList: [
        BottomNavigationBarItem(
            label: "首页",
            icon: SvgPicture.asset(
              "assets/svg/home_fill.svg",
              height: 20.w,
              color: index == 0
                  ? Theme.of(context).primaryColor
                  : Color(0XFF999999),
            )),
        BottomNavigationBarItem(
            label: "个人中心",
            icon: SvgPicture.asset(
              "assets/svg/person-fill.svg",
              height: 20.w,
              color: index == 1
                  ? Theme.of(context).primaryColor
                  : Color(0XFF999999),
            ))
      ],
      bottomsUnselectedItemColor: const Color(0XFF999999),
      child: pages[index],
    );
  }
}