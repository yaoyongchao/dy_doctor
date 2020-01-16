import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:dy_doctor/pages/fans/fans_page.dart';
import 'package:dy_doctor/pages/income/Income_page.dart';
import 'package:dy_doctor/pages/mine/mine_page.dart';
import 'package:dy_doctor/pages/workbench/workbench_page.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  final tabWidth = 24.0;
  final tabHeight = 24.0;
  //当前选中页索引
  var _currentIndex = 0;
  currentPage() {
    switch(_currentIndex) {
      case 0:
        return WorkbenchPage();
      case 1:
        return FansPage();
      case 2:
        return IncomePage();
      case 3:
        return MinePage();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //通过FixedColor设置选中的item的颜色
        type: BottomNavigationBarType.fixed,
        //当前页面索引
        currentIndex: _currentIndex,
        //按下后设置当前页面索引
        onTap: ((index){
          setState(() {
            _currentIndex = index;
          });
        }),
        //底部导航按钮选项
        items: [
          BottomNavigationBarItem(
            title: Text(
                "工作台",
              style: TextStyle(
                color: _currentIndex == 0 ? Color(MyColors.tabSelected) : Color(MyColors.tabNromal)
              ),
            ),
            //判断当前索引做图片的切换
            icon: _currentIndex == 0 ? Image.asset("images/ic_tab1_selected.png",width: tabWidth,height: tabHeight,) : Image.asset("images/ic_tab1_normal.png",width: tabWidth,height: tabHeight,)
          ),
          BottomNavigationBarItem(
              title: Text(
                "粉丝",
                style: TextStyle(
                    color: _currentIndex == 1 ? Color(MyColors.tabSelected) : Color(MyColors.tabNromal)
                ),
              ),
              //判断当前索引做图片的切换
              icon: _currentIndex == 1 ? Image.asset("images/ic_tab2_selected.png",width: tabWidth,height: tabHeight,) : Image.asset("images/ic_tab2_normal.png",width: tabWidth,height: tabHeight,)
          ),
          BottomNavigationBarItem(
              title: Text(
                "收益",
                style: TextStyle(
                    color: _currentIndex == 2 ? Color(MyColors.tabSelected) : Color(MyColors.tabNromal)
                ),
              ),
              //判断当前索引做图片的切换
              icon: _currentIndex == 2 ? Image.asset("images/ic_tab3_selected.png",width: tabWidth,height: tabHeight,) : Image.asset("images/ic_tab3_normal.png",width: tabWidth,height: tabHeight,)
          ),
          BottomNavigationBarItem(
              title: Text(
                "我的",
                style: TextStyle(
                    color: _currentIndex == 3 ? Color(MyColors.tabSelected) : Color(MyColors.tabNromal)
                ),
              ),
              //判断当前索引做图片的切换
              icon: _currentIndex == 3 ? Image.asset("images/ic_tab4_selected.png",width: tabWidth,height: tabHeight,) : Image.asset("images/ic_tab4_normal.png",width: tabWidth,height: tabHeight,)
          )
        ],
      ),
      body: currentPage(),
    );
  }

  @override
  void dispose() {
    //释放内存，节省开销
    super.dispose();

  }
}
