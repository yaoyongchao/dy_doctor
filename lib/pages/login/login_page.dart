import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
//      decoration: BoxDecoration(
//        color: Colors.white
//      ),
      child: Column(
        children: <Widget>[
          Text("111"),
          OutlineButton(
            child: Text("网络请求"),
            onPressed: (){
              print("您点击了---");
              getHttp();
            },
          )
        ],
      ),
    );
  }
  void getHttp() async {
    try{
      Response response = await Dio().get("http://api.dev.dayiketang.com/app/doctor/login/islogin?app_token=DYKTAPP%2F%2F9dffcc6a01336a6f904e80caed74dcc3%3D%3D%2F%2Fsi");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
