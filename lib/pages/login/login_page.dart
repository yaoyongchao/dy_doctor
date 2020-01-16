import 'package:dio/dio.dart';
import 'package:dy_doctor/base/mvp/mvp_base_widget_state.dart';
import 'package:dy_doctor/net/net_url.dart';
import 'package:dy_doctor/net/net_util.dart';
import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/res/strings.dart';
import 'package:dy_doctor/routers/routes.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:dy_doctor/widgets/text_fiel_clear.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_contract.dart';
import 'login_presenter.dart';
/**
 * 登录成功
 */
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
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: mHeight,
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
              hintText: "请输入后手机号",
              maxLength: 11,
              keyboardType: TextInputType.phone,
              showBoder: true,
              onChanged: (value) {
                LogUtil.i("我时好人啊： " + value);
              },
            ),

            Container(
              decoration: BoxDecoration(
                border:  Border(bottom: BorderSide(color: Color(MyColors.borderDefault),width: Dimens.sizeBorder)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextFieldClear(
                      mWidth: 200.0,
                      mHeight: 200.0,
                      hintText: "请输入密码",
                      keyboardType: TextInputType.number,
                      showBoder: false,
                      maxLength: 6,
                      onChanged: (value) {
                        LogUtil.i("我时好人啊： " + value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  FlatButton(
                    child: Text("发送验证码",style:TextStyle(fontSize: 16)),
                    padding: EdgeInsets.all(0.0),
                    textColor: Color(MyColors.colorGey),
                    onPressed: (){
                      LogUtil.i("111111");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              children: <Widget>[
                Text("未注册的手机号,请",
                  style: TextStyle(
                      fontSize: 12.0
                  ),
                ),
                Text("联系客服",
                  style: TextStyle(
                      fontSize: 12.0,
                      color:Color(0xfff7ba53),
                      decoration: TextDecoration.underline
                  ),),
                Text("注册",
                  style: TextStyle(
                      fontSize: 12.0
                  ),),
              ],
            ),
            SizedBox(
              width: 1,
              height: 40.0,
            ),
            FlatButton(
              child: Container(
                alignment: Alignment.center,
                child: Text("登 录",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                height: 44.0,
                width: double.infinity,
              ),
//            colorBrightness: Brightness.dark,
              hoverColor: Color(MyColors.colorBtnLoginPressed),
              color: Color(MyColors.colorBtnLoginNormal),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
              onPressed: () {
                LogUtil.i("aaa");
                Routes.doNext(context, Routes.home);
              },
            ),
            Expanded(
              child: Text(""),
            ),
            Container(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/ic_kf.png"),
                      width: 13.0,
                      height: 13.0,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "客服热线 " + Strings.customerHotline,
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Color(MyColors.colorGey)
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFF1F0F5),width: 0.5),
                    borderRadius: BorderRadius.circular(15.0)

                ),
                alignment: Alignment.center,
                width: 200.0,
                height: 32.0,

              ),
              alignment: Alignment.center,
            ),
            Container(
              height: 30.0,
              alignment: Alignment.center,
              child: Text(
                "我已阅读并同意《用户协议》",
                style: TextStyle(
                    fontSize: 10.0,
                    color: Color(0xFFC1C1C1)
                ),
              ),
              margin: EdgeInsets.fromLTRB(0,0,0,0),
            ),
          ],
        ),
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

