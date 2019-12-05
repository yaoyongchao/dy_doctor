import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:flutter/material.dart';
class TextFieldClear extends StatefulWidget {
  final double mWidth;
  final double mHeight;
  TextFieldClear({Key key,this.mWidth,this.mHeight}) : super(key:key);
  @override
  _TextFieldClearState createState() => _TextFieldClearState();
}

class _TextFieldClearState extends State<TextFieldClear> {
  var _clearText = false;
  var controller;
  var text = "";
  void clearText() {
    _clearText = true;
    setState(() {
      LogUtil.i("_clear" + _clearText.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
//    this.controller.text = "faklfks";
   /* controller.addListener(() {});
    controller.value = TextEditingController.fromValue(TextEditingValue(
        text: "12212",  //判断keyword是否为空
        // 保持光标在最后

        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            ))),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      border:  Border(bottom: BorderSide(color: Color(MyColors.borderDefault),width: 1.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller:  controller,
              keyboardType: TextInputType.phone,
              cursorWidth: 0.5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "请输入后手机号",
                hintStyle: TextStyle(
                  color: Color(MyColors.colorHint),
                ),
              ),
              style:  TextStyle(
                fontSize: Dimens.sizeLogin,
              ),

            ),
          ),
          SizedBox(
            width: 30.0,
            height: 1.0,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
              child: Image(
                image: AssetImage("images/ic_delete.png"),
                width: 20.0,
              ),
            ),
            onTap: (){
              LogUtil.i("aaa" + controller.text.toString());
              controller.text = "";

            },
          )
        ],
      ),
    );
  }

}



/*

TextField(
keyboardType: TextInputType.phone,
cursorWidth: 0.5,
decoration: InputDecoration(
focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(color: Color(MyColors.borderDefault)),
),
hintText: "请输入后手机号",
hintStyle: TextStyle(
color: Color(MyColors.colorHint),
),
),
style:  TextStyle(
fontSize: Dimens.sizeLogin,
),
),*/
