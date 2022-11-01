import 'package:flutter/cupertino.dart';

class RefreshViewModel extends ChangeNotifier {
  List<String> dataList = [];
  int curIndex = 0;


  RefreshViewModel(){
    print("RefreshViewModel create");
  }

  Future loadModeList() async {
    curIndex += 1;
    print("loadModeList:$curIndex");
    await Future.delayed(Duration(seconds: 2), () {
      for (int i = 0; i < 20; i++) {
        dataList.add("刷新$curIndex次数据$i");
      }
    });
    notifyListeners();
  }

  Future refreshList() async {
    curIndex = 0;
    print("refreshList:$curIndex");
    dataList.clear();
    await Future.delayed(Duration(seconds: 2), () {
      for (int i = curIndex; i < curIndex + 20; i++) {
        dataList.add("刷新$curIndex次数据$i");
      }
    });
    notifyListeners();
  }
}
