import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
///生命周期小总结
///
//生命周期整体分为三个部分：初始化 / 状态改变 / 销毁；
//initState 在整个生命周期中的初始化阶段只会调用一次；
//didChangeDependencies 当 State 对象依赖发生变动时调用；
//didUpdateWidget 当 Widget 状态发生改变时调用；实际上每次更新状态时，Flutter 会创建一个新的 Widget，并在该函数中进行新旧 Widget 对比；一般调用该方法之后会调用 build；
//reassemble 只有在 debug 或 热重载 时调用；
//deactivate 从 Widget Tree 中移除 State 对象时会调用，一般用在 dispose 之前；
//dispose 用于 Widget 被销毁时，通常会在此方法中移除监听或清理数据等，整个生命周期只会执行一次；
//resumed 应用程序可见且获取焦点状态，类似于 Android onResume()；
//inactive 应用程序处于非活动状态；
//paused 应用程序处于用户不可见，不响应用户状态，处于后台运行状态，类似于 Android onPause()；
abstract class BaseWidgetState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver{
  BuildContext mContext;
  double mHeight;
  double mWidth;
  bool isShowAppBar = true;

  BaseWidgetState(){
    LogUtil.i("我是构造函数");
  }

  /**
   * StatefulWidget 创建完后调用的第一个方法，而且只执行一次 类似于 Android 的 onCreate、iOS 的 viewDidLoad()，所以在这里 View 并没有渲染
   */
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    onCreate();
  }

  /**
   * 当 StatefulWidget 第一次创建的时候，didChangeDependencies方法会在 initState方法之后立即调用，之后当 StatefulWidget 刷新的时候，就不会调用了
   * ，除非你的 StatefulWidget 依赖的 InheritedWidget 发生变化之后，didChangeDependencies才会调用，所以 didChangeDependencies有可能会被调用多次。
   * 这个函数会紧跟在initState之后调用，并且可以调用BuildContext.inheritFromWidgetOfExactType，那么BuildContext.inheritFromWidgetOfExactType的使用场景是什么呢？最经典的应用场景是 Tab切换
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    this.mContext = context;
    final size = MediaQuery.of(context).size;
    mWidth = size.width;
    mHeight = size.height;
    return Theme(
      data: ThemeData(
        cursorColor: Color(MyColors.colorDefault),
        primaryColor: Colors.white
      ),
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: isShowAppBar,
            child: Scaffold(
              appBar: AppBar(
                title: Text("title"),
              ),
              body: Container(
                child: buildWidgets(),
              ),
            ),
          ),
          Visibility(
            visible: !isShowAppBar,
            child: Scaffold(
              body: Container(
                child: buildWidgets(),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget buildWidgets();

  ///模仿Android生命周期
  void onCreate(){
    LogUtil.i("onCreate");
  }
  void onResume(){
    LogUtil.i("onResume");
  }
  void onPause(){
    LogUtil.i("onPause");
  }
  void onStop(){
    LogUtil.i("onStop");
  }
  void onDestory(){
    LogUtil.i("onDestory");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) {
      LogUtil.i("AppLifecycleState.paused--后台运行");
      onPause();
    }else if(state == AppLifecycleState.resumed) {
      LogUtil.i("AppLifecycleState.resumed--前台运行");
      onResume();
    }else if(state == AppLifecycleState.inactive) {
      LogUtil.i("AppLifecycleState.inactive--应用程序处于非活动状态；不能跟用户交互");
    }else if(state == AppLifecycleState.suspending) {
      LogUtil.i("AppLifecycleState.suspending--申请将暂停片刻。");
    }
  }

  ///deactivate（组件移除时）
  //
  //当要将 State 对象从渲染树中移除的时候，就会调用 deactivate生命周期，这标志着 StatefulWidget 将要销毁，但是有时候 State 不会被销毁，而是重新插入到渲染树种。
  @override
  void deactivate() {
    super.deactivate();
    onStop();
  }

///dispose（组件移除时）
//
//当 View 不需要再显示，从渲染树中移除的时候，State 就会永久的从渲染树中移除，就会调用 dispose生命周期，这时候就可以在 dispose里做一些取消监听、动画的操作，和 initState是相反的。
  @override
  void dispose() {
    super.dispose();
    onDestory();
    WidgetsBinding.instance.removeObserver(this);
  }

  ///吐司
  void toast(String str) {
    Fluttertoast.showToast(msg: str);
  }
}
