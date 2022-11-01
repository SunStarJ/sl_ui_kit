import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';

class DioInstance {
  ///静态实例
  static DioInstance? _instance;
  static final Dio _dio = Dio(BaseOptions(contentType: "application/x-www-form-urlencoded"));

  /// 私有的命名构造函数,在此处初始化
  DioInstance._internal();

  ///定义getInstance方法获取实例
  static DioInstance getInstance() {
    ///如果定义的实例为空，将构造函数赋值给实例
    _instance ??= DioInstance._internal();
    _dio.interceptors.add(dioLoggerInterceptor);

    ///返回实例
    return _instance!;
  }

  Dio get dio => _dio;
}
