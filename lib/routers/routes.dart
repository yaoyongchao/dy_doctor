import 'package:dy_doctor/pages/home/home_page.dart';
import 'package:dy_doctor/pages/login/login_page.dart';
import 'package:dy_doctor/pages/mine/personalinfor/personal_infor_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:dy_doctor/main.dart';
import '../application.dart';
import '../pages/login/guide_page.dart';
import '../pages/login/splash_page.dart';

class Routes{
  static String root = "/";
  static String ma = "/lib/main";
  static String splash = "/splash";
  static String guide = "/guide";
  static String home = "/pages/home/home_page";
  static String personal = "/pages/mine/personalinfor";
  static String login = "/login";

//  static String work
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print("Route was not found!!!");
      }
    );
    router.define(root, handler: Handler(handlerFunc: (context,params)=>SplashPage()));
    router.define(guide, handler: Handler(handlerFunc: (context,params)=>GuidePage()));
    router.define(login, handler: Handler(handlerFunc: (context,params)=>LoginPage()));
    router.define(home, handler: Handler(handlerFunc: (context,params)=>HomePage()));
    router.define(personal, handler: Handler(handlerFunc: (context,params)=>PersonalInforPage()));
  }

  static void doNext(BuildContext context,String routPath) {
    // replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, routPath, replace: false);
  }

  static void doNextNoBack(BuildContext context,String routPath) {
    Application.router.navigateTo(context, routPath, replace: true);
  }
}