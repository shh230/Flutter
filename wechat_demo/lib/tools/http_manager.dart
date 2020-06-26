/*
 * @author Si
 * @create date 2020-06-26
 * @desc 网络请求
 */
import 'package:dio/dio.dart';

class HttpManager {
  static final dio = Dio();

  static Future request(String url,
      {String method = 'get',
      Map<String, dynamic> queryParameters,
      int timeOut}) {

    // 创建网络请求配置，什么方式请求
    final options = Options(method: method, receiveTimeout: timeOut);

    // 发起网络请求
    return dio.request(
        url,
        queryParameters: queryParameters,
        options: options
    );
  }
}

/*
* http get 网络请求
* */
Future<Response> get(url,
    {Map<String, String> headers,
    Map<String, dynamic> queryParameters,
    int timeOut}) {
  return HttpManager.request(url,
      method: 'get', queryParameters: queryParameters, timeOut: timeOut);
}

/*
* http post 网络请求
* */
Future<Response> post(url,
    {Map<String, String> headers,
      Map<String, dynamic> queryParameters,
      int timeOut}) {
  return HttpManager.request(url,
      method: 'post', queryParameters: queryParameters, timeOut: timeOut);
}
