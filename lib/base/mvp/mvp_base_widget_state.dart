import 'package:dy_doctor/utils/log_util.dart';
import 'package:flutter/cupertino.dart';

import 'base_presenter.dart';
import 'base_view.dart';
import '../base_widget_state.dart';

abstract class MvpBaseWidgetState<T extends StatefulWidget,V extends BaseView,P extends BasePresenter<V>> extends BaseWidgetState<T> {
  P presenter;
  @override
  void initState() {
    presenter =getPresenter();
    presenter.attachView(this as V);
    LogUtil.i("presenter" + presenter.toString());
    super.initState();
  }

  @override
  void dispose() {
    presenter.detachView();
    presenter = null;
    super.dispose();

  }

  P getPresenter();
}

