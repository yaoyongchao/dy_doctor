import 'package:dy_doctor/base/base_widget_state.dart';
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
      child: Text("我的"),
    );
  }
}
