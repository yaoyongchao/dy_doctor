import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:flutter/material.dart';

class WorkbenchPage extends StatefulWidget {
  @override
  _WorkbenchPageState createState() => _WorkbenchPageState();
}

class _WorkbenchPageState extends BaseWidgetState<WorkbenchPage> {
  @override
  bool get isShowAppBar => false;

  @override
  Widget buildWidgets() {
    return Container(
      child: Text("工作台"),
    );
  }
}
