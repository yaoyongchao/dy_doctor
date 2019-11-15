import 'package:dy_doctor/net/net.dart';
import 'package:dy_doctor/net/net_url.dart';

class NetUtil {
  //登录
  static void login(Map<String,dynamic> params,{Function success,Function failure}) {
    Net().post(NetUrl.LOGIN, params,success: success,failure: failure);
  }
}