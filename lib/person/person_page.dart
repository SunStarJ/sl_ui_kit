import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sl_ui_kit/person/enter_card.dart';
import 'package:sl_ui_kit/person/header.dart';
import 'package:sl_ui_kit/router.dart';
import 'dart:ui';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(this.context).push(StaticPath.qrScan);
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: Colors.black,
                    size: 15,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 15,
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: EasyRefresh(
            child: const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: HeaderCard(),
                ),
                SliverToBoxAdapter(
                  child: EnterCard(),
                )
              ],
            ),
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2));
              return IndicatorResult.success;
            },
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
