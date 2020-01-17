import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/routers/routes.dart';
import 'package:dy_doctor/widgets/mine_item.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends BaseWidgetState<MinePage> {
  @override
  bool get isShowAppBar => false;

  @override
  Widget buildWidgets() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0,24.0,0,0),
            width: double.infinity,
            height: 38.0,
            child: Text(
              "医生中心",
              style: TextStyle(
                  fontSize: Dimens.txtLarge,
                  fontWeight: FontWeight.w600,
                  color: Color(MyColors.colorDefault)
              ),
            ),
          ),
          Container(
            color: Color(MyColors.bgGray),
            height: 6.0,
            width: double.infinity,
          ),
          MineItem(
            imgPath: "images/ic_my_data.png",
            txtValue: "我的资料",
            onTap: () {
              Routes.doNext(context, Routes.personal);
            },
          ),
          MineItem(
            imgPath: "images/ic_my_voice.png",
            txtValue: "我的语音问答",
            onTap: () {
            },
          ),
          MineItem(
            imgPath: "images/ic_my_video.png",
            txtValue: "我的视频",
            showBorder: false,
            onTap: () {
            },
          ),
          Container(
            color: Color(MyColors.bgGray),
            height: 6.0,
            width: double.infinity,
          ),
          MineItem(
            imgPath: "images/ic_my_fuwu.png",
            txtValue: "服务条款",
            onTap: () {
            },
          ),
          MineItem(
            imgPath: "images/ic_my_about_us.png",
            txtValue: "关于我们",
            onTap: () {
            },
          ),
          MineItem(
            imgPath: "images/ic_my_current_version.png",
            txtValue: "当前版本",
            showBorder: false,
            onTap: () {
            },
          ),
          Container(
            color: Color(MyColors.bgGray),
            height: 20.0,
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 50.0,
            child: FlatButton(
              child: Text(
                "退出登录",
                style: TextStyle(
                    color: Color(0xFFD74326),
                  fontSize: 17.0
                ),
              ),
              onPressed: () {

              },
              color: Colors.white,
              highlightColor: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              color: Color(MyColors.bgGray),
            )
          )



        ],

      ),
    );
  }
}
