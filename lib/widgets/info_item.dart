import 'package:dy_doctor/res/my_colors.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  var text;
  var textsub;
  var showBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Color(MyColors.colorDefault),
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          Divider(
            height: 0,
            color: Color(MyColors.borderDefault),
          )
        ],
      ),
    );
  }
}
