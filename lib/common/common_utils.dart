import 'package:dy_doctor/common/common_params.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CommonUtils{
  static void saveToken() {

  }
  static Future getToken() {

  }

  static Future<bool> isFirstUse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(CommonParams.isFirst) ?? true;
  }

  static Future setNoFirstUse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(CommonParams.isFirst, false);
  }
}