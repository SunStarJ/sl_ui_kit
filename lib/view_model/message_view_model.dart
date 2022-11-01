import 'dart:math';

import 'package:flutter/cupertino.dart';

class MessageViewModel extends ChangeNotifier {
  int msg1Num = 0;
  int msg2Num = 0;

  MessageViewModel() {
    print("MessageViewModel create");
    initMessageNum();
  }

  void initMessageNum() async {
    Future.delayed(const Duration(seconds: 2), () {
      msg1Num = Random().nextInt(50);
      msg2Num = Random().nextInt(20);
      notifyListeners();
    });
  }
}
