import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sl_ui_kit/router.dart';

class EnterCard extends StatelessWidget {
  const EnterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> enterList = ["列表刷新", "表格刷新", "测试", "账户"];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 2.w, color: Colors.black26)]),
      child: ListView.separated(
        padding: EdgeInsets.only(top: 0),
          itemBuilder: (ctx, index) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              if(index == 0){
                context.push(StaticPath.refreshList);
              }else if(index == 1){
                context.push(StaticPath.refreshGrid);
              }
            },
            child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: Text(enterList[index]),
                ),
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (ctx, index) => Container(
                height: 1.w,
                color: Colors.grey,
              ),
          itemCount: enterList.length),
    );
  }
}
