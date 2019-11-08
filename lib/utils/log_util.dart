class LogUtil{
  static final bool isLog = true;//是否打印日志默认true ，打印
  static final tag = "dayi";

  static void log(String str) {
    if(isLog)
      print(tag+"--" + str);
  }
}