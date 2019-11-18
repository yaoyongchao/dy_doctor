import 'base_view.dart';

class BasePresenter<V extends BaseView> {
  BaseView _view;
  void attachView(BaseView view) {
    _view = view;
  }

  void detachView() {
    if(_view != null) {
      _view = null;
    }
  }

  V getView(){
    return _view;
  }
}