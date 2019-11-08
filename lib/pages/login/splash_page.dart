import 'dart:async';
import 'dart:math';

import 'package:dy_doctor/common/common_params.dart';
import 'package:dy_doctor/common/common_utils.dart';
import 'package:dy_doctor/routers/routes.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
var myTimer;
class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final timeout = const Duration(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("images/splash.png"),
    );
  }
  @override
  Future initState() {
    initTimer();
    super.initState();
  }

  void initTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isFirst = prefs.getBool(CommonParams.isFirst)??true;
    LogUtil.log("是否第一次打开应用：" + isFirst.toString());
    if(isFirst) {
      Routes.doNextNoBack(context, Routes.guide);
    } else {
      myTimer = new Timer(timeout,(){
        Routes.doNext(context, Routes.login);
      });
    }
  }

  @override
  void dispose() {
    if(myTimer!=null)
      myTimer.cancel();
    super.dispose();

  }
}
