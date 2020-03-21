import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

class RowAndColumnBoxApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body: RowTestRoute(),
        ));
  }
}

class RowTestRoute extends StatefulWidget {
  @override
  RowTestRouteState createState() => new RowTestRouteState();
}

class RowTestRouteState extends State<RowTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Text(
              " hello world ",
              style: TextStyle(fontSize: 30.0),
            ),
            Text(" I am Jack "),
          ],
        ),

        //如果Row里面嵌套Row，或者Column里面再嵌套Column，
        // 那么只有对最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小，下面以Column为例说明：
        Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                    children: <Widget>[
                      Text("hello world "),
                      Text("I am Jack "),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),


        //如果要让里面的Column占满外部Column，
        // 可以使用Expanded 组件：
        Expanded(
          child: Container(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
              children: <Widget>[
                Text("hello world "),
                Text("I am Jack "),
              ],
            ),
          ),
        )

      ],
    );
  }
}

ThemeData buildShrineTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,

    //使用自定义的主图标主题
    //在 _buildShrineTheme() 函数中添加以下代码：
    // TODO: Add the icon theme (103)
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),

    // TODO: Decorate the inputs (103)

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}
