import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:flutter/material.dart';

class IncomePage extends StatefulWidget {
  @override
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends BaseWidgetState<IncomePage> {
  @override
  bool get isShowAppBar => false;

  @override
  Widget buildWidgets() {

    return Container(
      child: Text("收入"),
    );
  }
}
