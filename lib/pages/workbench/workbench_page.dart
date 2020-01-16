import 'package:dy_doctor/base/base_widget_state.dart';
import 'package:dy_doctor/res/dimens.dart';
import 'package:dy_doctor/res/my_colors.dart';
import 'package:dy_doctor/utils/log_util.dart';
import 'package:flutter/material.dart';

class WorkbenchPage extends StatefulWidget {
  @override
  _WorkbenchPageState createState() => _WorkbenchPageState();
}

class _WorkbenchPageState extends BaseWidgetState<WorkbenchPage> {
  final double _borderHeight = 40.0;
  @override
  bool get isShowAppBar => false;

  @override
  Widget buildWidgets() {
    return Container(
      width: mWidth,
      height: mHeight,
      color: Color(0xFFF5F5F5),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: mWidth,
                    height: 245.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF586F), Color(0xFFFF7A4D)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                  ),
                  Container(
                    color: Colors.amber,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(0,32,16,0),
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: Image(
                        image: AssetImage("images/ic_contact_help.png"),
                        width: 23.0,
                        height: 20.0,

                      ),
                      onTap: () {
                        LogUtil.i("点击了");
                      },
                    ),
                  ),
                  ClipOval(
                    child: Image(
//                  image: AssetImage("images/ic_avatar.png"),
                      image: NetworkImage("https://pic.qqtn.com/up/2019-8/2019082116360434468.jpg"),
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    "李树亭",
                    style: TextStyle(
                      fontSize: Dimens.txtLarger,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    "主任医师",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.txtSmaller
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "中国医学科学院肿瘤医院 / 肿瘤科",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 93.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(15.0, 21.0, 15.0, 0),
//                color: Colors.white,
                    decoration: new BoxDecoration(
                      //背景
                      color: Colors.white,
                      //设置四周圆角，角度
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      //设置四周边框
//                  border: Border.all(width: 1,color: Colors.red)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: WorkItem(
                            txtValue: 0,
                            txtUnit: '/期',
                            txtDesc: '贡献科普',
                          ),
                        ),
                        Container(
                          color: Color(0xFFE7E6EB),
                          height: _borderHeight,
                          child: VerticalDivider(width: 1.0,indent: 0.0,color: Color(0xFFE7E6EB),),
                        ),
                        Expanded(
                          child: WorkItem(
                            txtValue: 0,
                            txtUnit: '/期',
                            txtDesc: '贡献科普',
                          ),
                        ),
                        Container(
                          color: Color(0xFFE7E6EB),
                          height: _borderHeight,
                          child: VerticalDivider(width: 1.0,indent: 0.0,color: Color(0xFFE7E6EB),),
                        ),
                        Expanded(
                          child: WorkItem(
                            txtValue: 0,
                            txtUnit: '/期',
                            txtDesc: '贡献科普',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          //常用功能
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
            decoration: new BoxDecoration(
              //背景
              color: Colors.white,
              //设置四周圆角，角度
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              //设置四周边框
//                  border: Border.all(width: 1,color: Colors.red)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    '常用视频',
                    style: TextStyle(
                        color: Color(MyColors.colorDefault),
                        fontSize: Dimens.txtLarge,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.start,
                  ),
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                )

              ],
            ),
          )

        ],
      )
    );
  }
}


class WorkItem extends StatefulWidget {
  var txtUnit ;
  var txtDesc;
  var txtValue;

  WorkItem({Key key,this.txtUnit, this.txtDesc, this.txtValue}) : super(key:key);

  @override
  _WorkItemState createState() => _WorkItemState(txtUnit,txtDesc,txtValue);
}

class _WorkItemState extends State<WorkItem> {
  var txtUnit ;
  var txtDesc;
  var txtValue;
  final txtStyle = TextStyle (
    color: Color(MyColors.colorDefault),
    fontSize: Dimens.txtSmaller
  );

  _WorkItemState(this.txtUnit, this.txtDesc, this.txtValue);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              txtValue.toString(),
              style: TextStyle(
                  color: Color(MyColors.txtRed),
                  fontSize: 22.0
              ),
            ),
            Text(
              txtUnit,
              style: txtStyle,
            )
          ],
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          txtDesc,
          style: txtStyle,
        )
      ],
    );
  }
}

//功能Item
class FeaturesItem extends StatefulWidget {
  @override
  _FeaturesItemState createState() => _FeaturesItemState();
}

class _FeaturesItemState extends State<FeaturesItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

      ],
    );
  }
}

