import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

class ProgressBarApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body: ProgressBarTestRoute(),
        ));
  }
}

class ProgressBarTestRoute extends StatefulWidget {
  @override
  _ProgressBarTestRouteState createState() => new _ProgressBarTestRouteState();
}

class _ProgressBarTestRouteState extends State<ProgressBarTestRoute> {
  @override
  Widget build(BuildContext context) {
    return

      Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
// 模糊进度条(会执行一个动画)
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
//进度条显示50%
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
          // 模糊进度条(会执行一个旋转动画)
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
//进度条显示50%，会显示一个半圆
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),

          //自定义尺寸
// 线性进度条高度指定为3
          SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
          ),
// 圆形进度条直径指定为100
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .7,
            ),
          ),


        ],
      );
  }
}

//进度色动画
class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
    new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
      Padding(
      padding: EdgeInsets.all(16),
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
            .animate(_animationController), // 从灰色变成蓝色
        value: _animationController.value,
      ),
    )],
    )
    ,
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
