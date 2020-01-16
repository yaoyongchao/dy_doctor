import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:dy_doctor/pages/fans/fans_page.dart';
import 'package:dy_doctor/pages/income/Income_page.dart';
import 'package:dy_doctor/pages/mine/mine_page.dart';
import 'package:dy_doctor/pages/workbench/workbench_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  //Ｔａｂ页的控制器可以用来定义Ｔａｂ标签和内容页的坐标
  TabController tabController;

  //生命周期方法插入渲染树时调用，　只调用一次
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,//Tab页的个数
      vsync: this//动画效果的异步处理，默认格式
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          //创建之前写好的三个页面，万物皆Ｗｉｄｇｅｔ
          WorkbenchPage() ,
          FansPage(),
          IncomePage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: Material(
        //底部栏整体的颜色
        color: Colors.blueAccent,
        child: new TabBar(
          controller: tabController,
            tabs: <Tab>[
              Tab(text: "工作台",icon: Icon(Icons.android),),
              Tab(text: "粉丝",icon: Icon(Icons.home),),
              Tab(text: "收益",icon: Icon(Icons.account_balance),),
              Tab(text: "我的",icon: Icon(Icons.account_circle),)
            ],
          //tab被选中时的颜色，设置之后选中的时候， icon和text都会变色
          labelColor: Colors.amber,
          //tab未选中时的颜色， 设置之后选中的时候， icon和text都会变色
          unselectedLabelColor: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    //释放内存，节省开销
    tabController.dispose();
    super.dispose();

  }
}
