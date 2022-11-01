import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class ShareInstance {
  ///静态实例
  static ShareInstance? _instance;

  /// 私有的命名构造函数,在此处初始化
  ShareInstance._internal();

  ///定义getInstance方法获取实例
  static ShareInstance getInstance() {
    ///如果定义的实例为空，将构造函数赋值给实例
    _instance ??= ShareInstance._internal();

    ///返回实例
    return _instance!;
  }

  RxSharedPreferences? rxShare;

  Future<RxSharedPreferences> getShare() async {
    if (rxShare == null) {
      rxShare = (await SharedPreferences.getInstance()).rx;
    }
    return rxShare!;
  }
}
