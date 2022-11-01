import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:sl_ui_kit/data/state_entity.dart';
import 'package:sl_ui_kit/instance/share.dart';
import 'package:sl_ui_kit/model/user_repository.dart';
import 'package:sl_ui_kit/router.dart';

import '../static.dart';

class LoginViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  String? userName;
  String? pwd;
  bool canLoginClick = true;


  LoginViewModel(){
    initLoginData();
  }

  initLoginData() async {
    RxSharedPreferences share = await ShareInstance.getInstance().getShare();
    userName = await share.getString(StaticKey.phone) ?? "";
    pwd = await share.getString(StaticKey.pwd) ?? "";
    notifyListeners();
  }

  savePhone(String userName) {
    this.userName = userName;
  }

  savePwd(String pwd) {
    this.pwd = pwd;
  }

  Future<bool> login(String json) async {
    canLoginClick = false;
    notifyListeners();
    StateEntity entity =
        await UserRepository.login(userName!, pwd!, jsonString: json);
    canLoginClick = true;
    RxSharedPreferences share = await ShareInstance.getInstance().getShare();
    share.setString(StaticKey.phone, userName);
    share.setString(StaticKey.pwd, pwd);
    notifyListeners();
    return entity.code == 0;
  }
}
