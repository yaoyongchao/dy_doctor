import 'package:dio/dio.dart';
import 'package:dy_doctor/base/mvp/mvp_base_widget_state.dart';
import 'package:dy_doctor/net/net_url.dart';
import 'package:dy_doctor/net/net_util.dart';
import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:dy_doctor/widgets/text_fiel_clear.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_contract.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends MvpBaseWidgetState<LoginPage,LoginView,LoginPresenter> implements LoginView {

  @override
  bool get isShowAppBar => false;

  /*@override
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
              login();
//              getHttp();
            },
          ),
          OutlineButton(
            child: Text("下拉刷新， 加载更多"),
          )
        ],
      ),
    );
  }*/
  void getHttp() async {
    try{
      Response response = await Dio().get("http://api.dev.dayiketang.com/app/doctor/login/islogin?app_token=DYKTAPP%2F%2F9dffcc6a01336a6f904e80caed74dcc3%3D%3D%2F%2Fsi");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void login() {
    var params = {'aa':"zs"};
    NetUtil.login(params,success: (response){
      LogUtil.i("我拿到请求结果了----" + response.toString());

    },failure: (error){

    });
  }

  @override
  Widget buildWidgets() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(Dimens.marginLogin, 90.0, Dimens.marginLogin, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage("images/ic_logo_login.png"),
            width: 115.0,
            height: 32.0,
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            width: 1.0,
            height: 40.0,
          ),
          TextFieldClear(
            mWidth: double.infinity,
            mHeight: 200.0,
          ),

        ],
      ),
    );
  }

  @override
  LoginPresenter getPresenter() {
    return LoginPresenter();
  }

  @override
  void loginSuccess() {
  }
}

