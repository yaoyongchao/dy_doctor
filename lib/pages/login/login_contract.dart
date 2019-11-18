
import 'package:dy_doctor/base/mvp/base_presenter.dart';
import 'package:dy_doctor/base/mvp/base_view.dart';

abstract class LoginView extends BaseView {
  void loginSuccess();
}

abstract class ILoginPresenter extends BasePresenter<LoginView> {
  void login(String phone,String code);
}