import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  var list = const["images/ic_guide1.jpg","images/ic_guide2.jpg","images/ic_guide3.jpg"];
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
          index: 0,
          autoplay: false,
          duration: 300,
          pagination: SwiperPagination(),
        ),
        Positioned(
          bottom: 40.0,
          child: Text("按钮"),
        )
      ],
    );
  }
}

/*Swiper(
        itemBuilder: (BuildContext context,int dex){
          return Image.asset(list[dex],fit: BoxFit.fill,);
        },
        itemCount: 3,
        loop: false,
        index: 0,
        autoplay: true,
        duration: 300,
        pagination: SwiperPagination(),
      ),*/
