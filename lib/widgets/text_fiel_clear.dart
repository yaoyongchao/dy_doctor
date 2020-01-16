import 'dart:math';

import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:flutter/material.dart';
class TextFieldClear extends StatefulWidget {
  final double mWidth;
  final double mHeight;
  TextInputType keyboardType = TextInputType.text;
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool showBoder;//是否显示边框
  final int maxLength;
  TextFieldClear({Key key,this.mWidth,this.mHeight,this.keyboardType,this.onChanged,this.hintText,this.showBoder,this.maxLength}) : super(key:key);
  @override
  _TextFieldClearState createState() => _TextFieldClearState(keyboardType,onChanged,hintText,showBoder,maxLength);
}

class _TextFieldClearState extends State<TextFieldClear> {
  var _clearText = false;
  var controller;
  var text = "";
  final TextInputType keyboardType;
  final ValueChanged<String> _onChanged;
  final String _hintText;
  final bool _showBoder;
  var borderWidth = 1.0;
  final int maxLength;
  _TextFieldClearState(this.keyboardType, this._onChanged,this._hintText,this._showBoder,this.maxLength);

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
    borderWidth = _showBoder?1.0:0.0;
    LogUtil.i("widht:" + borderWidth.toString() + "--" + _showBoder.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      border:_showBoder?Border(bottom: BorderSide(color: Color(MyColors.borderDefault),width: 1.0)):null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller:  controller,
              keyboardType: this.keyboardType,
              cursorWidth: 0.5,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _hintText,
                hintStyle: TextStyle(
                  color: Color(MyColors.colorHint),
                ),
              ),
              style:  TextStyle(
                fontSize: Dimens.sizeLogin,
                  textBaseline: TextBaseline.alphabetic
              ),
              maxLines: 1,
              maxLengthEnforced: true,
              autocorrect: true,
              autofocus: true,
              onChanged: (value) {
                if(keyboardType == TextInputType.phone) {
                  value = value.replaceAll(" ", "");

                  if(value.length >= 4 ) {
                    text = value.replaceRange(2, 3, value.substring(2,3)+" ");
                    if(text.length>8) {
                      text = text.replaceRange(7, 8, value.substring(6,7)+" ");
                    }
                    controller.text = text;
                    //每次修改内容的时候需要在手动修改selection
                    controller.selection = TextSelection.fromPosition(
                        TextPosition(
                            affinity: TextAffinity.downstream,
                            offset: controller.text.length
                        )
                    );
                  }
                }
                _onChanged(value);
                setState(() {
                });
              },
            ),
          ),
          SizedBox(
            width: 30.0,
            height: 1.0,
          ),
          GestureDetector(
            child: Visibility(
              visible: controller.text.length == 0 ? false : true,
              child: Container(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 10.0),
                child: Image(
                  image: AssetImage("images/ic_delete.png"),
                  width: 20.0,
                ),
              ),
            ),
            onTap: (){
              LogUtil.i("aaa" + controller.text.toString());
              controller.text = "";
              setState(() {
              });

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
