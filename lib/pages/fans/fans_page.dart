import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:flutter/material.dart';

class FansPage extends StatefulWidget {
  @override
  _FansPageState createState() => _FansPageState();
}

class _FansPageState extends BaseWidgetState<FansPage> {

  @override
  bool get isShowAppBar => false;

  @override
  Widget buildWidgets() {

    return Container(
      child: Text("粉丝"),
    );
  }
}
