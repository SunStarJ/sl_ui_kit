import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/view_model/user_view_model.dart';

import '../data/user_entity.dart';
import '../view_model/message_view_model.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    UserData? user = context.watch<UserViewModel>().user;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 80.w,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12.w)),
          margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 80.w),
          child: ChangeNotifierProvider(
            create: (_) => MessageViewModel(),
            builder: (context, child) => buildMessage(context),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.w),
          width: 75.w,
          height: 75.w,
          child: user == null
              ? Container()
              : CircleAvatar(
                  radius: 1000,
                  backgroundImage: NetworkImage(user.headerImg ?? ""),
                ),
        ),
      ],
    );
  }

  Row buildMessage(BuildContext context) {
    int msg1 = context.watch<MessageViewModel>().msg1Num;
    int msg2 = context.watch<MessageViewModel>().msg2Num;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [buildColumnInfo("信息1", msg1), buildColumnInfo("信息2", msg2)],
    );
  }

  Widget buildColumnInfo(String s, int msgNum) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15.w,
        ),
        Text(
          s,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        Text(
          msgNum.toString(),
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
        SizedBox(
          height: 10.w,
        )
      ],
    );
  }
}
