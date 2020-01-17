import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:flutter/material.dart';

class MineItem extends StatelessWidget {
  var imgPath;
  var txtValue;
  var onTap;
  var showBorder = true;

  MineItem({Key key,this.imgPath, this.txtValue, this.onTap, this.showBorder}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(Dimens.marginDefault, 0, Dimens.marginDefault, 0),
        alignment: Alignment.centerLeft,
        height: 57.0,
        child: Row(
          children: <Widget>[
            Image(
//            image: AssetImage("images/ic_home_item1.png"),
              image: AssetImage(imgPath),
              width: 20.0,
              height: 20.0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(10,0,0,0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              txtValue,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(MyColors.colorDefault),
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage("images/ic_arrows_right.png"),
                            width: 16.0,
                            height: 16.0,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: showBorder == null ? true : showBorder,
                      child: Divider(
                        color: Color(MyColors.borderDefault),
                        height: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
