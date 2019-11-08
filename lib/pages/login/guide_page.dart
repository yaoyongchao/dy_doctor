import 'dart:math';

import 'package:dy_doctor/common/common_params.dart';
import 'package:dy_doctor/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  var list = const["images/ic_guide1.jpg","images/ic_guide2.jpg","images/ic_guide3.jpg"];
  int swipIndex = 0;
  bool endPage = false;
  void _endpage(int index) {
    setState(() {
      swipIndex = index;
      if(swipIndex == list.length-1) {
        endPage = true;
      } else {
        endPage = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.loose,
      overflow: Overflow.clip,
      children: <Widget>[
        Swiper(
          itemBuilder: (BuildContext context,int dex){
            return Image.asset(list[dex],fit: BoxFit.fill,);
          },
          itemCount: 3,
          loop: false,
          index: swipIndex,
          autoplay: false,
          duration: 300,
          pagination: SwiperPagination(),
          onIndexChanged: (int index){
            _endpage(index);
          },
        ),
        Visibility(
          visible: endPage,
          child: Container(
            margin:EdgeInsets.all(40.0),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            child: FlatButton(
              child: Text("启动应用"),
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                setNoFirst();
                Routes.doNext(context, Routes.login);
              },
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: -10,
          child: Visibility(
            visible: !endPage,
            child: FlatButton(
              child: Text("跳过"),
              padding: EdgeInsets.all(10.0),
              colorBrightness: Brightness.dark,
              color: Colors.blue,
              shape:CircleBorder(),
              onPressed: () {
                print("跳过");
              },
            ),
          ),
        )
      ],
    );
  }

  void setNoFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(CommonParams.isFirst, false);
  }
}

