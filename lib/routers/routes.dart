import 'package:dy_doctor/pages/login/login_page.dart';
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
  static String home = "/lib/home";
  static String login = "/login";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params) {
        print("Route was not found!!!");
      }
    );
    router.define(root, handler: Handler(handlerFunc: (context,params)=>SplashPage()));
    router.define(guide, handler: Handler(handlerFunc: (context,params)=>GuidePage()));
    router.define(login, handler: Handler(handlerFunc: (context,params)=>LoginPage()));
  }

  static void doNext(BuildContext context,String routPath) {
    // replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, routPath, replace: false);
  }

  static void doNextNoBack(BuildContext context,String routPath) {
    Application.router.navigateTo(context, routPath, replace: true);
  }
}