import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dy_doctor/net/base_model.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:dy_doctor/utils/log_util.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';

enum Method {
  get,
  post
}

class Net{
  //工厂模式
  factory Net() => _getInstance();
  static Net get instance => _getInstance();
  static Net _instance;
  Dio _dio;
  Net._internal() {
    ///初始化
    _dio = Dio(
      BaseOptions(
        connectTimeout: 30000,///链接服务器超时时间，单位毫秒
        receiveTimeout: 10000,// 响应流上前后两次接受到数据的间隔，单位为毫秒, 这并不是接收数据的总时限.
      )
    );
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        LogUtil.i("================================== 请求数据 ===============================");
        LogUtil.i("url = ${options.uri.toString()}");
        LogUtil.i("headers = ${options.headers}");
        LogUtil.i("params = ${options.data}");
        LogUtil.i("==========================================================================");
        return options;
      },
      onResponse: (Response response){
        LogUtil.i("================================== 响应数据 ===============================");
        LogUtil.i("code = ${response.statusCode.toString()}");
        LogUtil.i("data = ${response.data}");
        LogUtil.i("==========================================================================");
        return response;
      },
      onError: (DioError e){
        LogUtil.i("\n================================== 错误响应数据 ===============================");
        LogUtil.i("type = ${e.type}");
        LogUtil.i("message = ${e.message}");
        LogUtil.i("\n==========================================================================");
        return e;//continue
      },
    ));
  }

  //单例模式
static Net _getInstance() {
    if(_instance ==null)
      _instance = Net._internal();
    return _instance;
  }

  get(String url,Map<String,dynamic> params,{Function success,Function failure}) {
    _doRequest(url, params, Method.get, success,failure);
  }

  post(String url,Map<String,dynamic> params,{Function success,Function failure}) {
    _doRequest(url, params, Method.post, success, failure);
  }

  void _doRequest(String url,Map<String,dynamic> params,Method method,Function successCallBack,Function failureCallBack) async {
    try {
      Response response;
      switch (method) {
        case Method.get:
          if(params != null && params.isNotEmpty) {
            response = await _dio.get(url,queryParameters: params);
          } else {
            response = await _dio.get(url);
          }
          break;
        case Method.post:
          if(params != null && params.isNotEmpty) {
            response = await _dio.post(url,queryParameters: params);
          } else {
            response = await _dio.post(url);
          }
          break;
      }

      Map<String,dynamic> result = json.decode(response.toString());
      //转化为model
      BaseModel model = BaseModel.fromJson(result);
      if(model.code == 0){ //表示成功
        if(successCallBack != null) {
          successCallBack(model.data);
        }
      } else {
        if(failureCallBack != null)
          failureCallBack(model.msg);
      }
    } catch (exception) {
      LogUtil.i('错误：${exception.toString()}');
      if(failureCallBack != null) {
        failureCallBack(exception.toString());
      }
    }
  }

}