import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

class TextApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body: SafeArea(
              child: ListView(
            children: <Widget>[
              Text(
                "Hello world",
                textAlign: TextAlign.left,
              ),
              Text(
                "Hello world! I'm Jack. " * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                  // recognizer: _tapRecognizer
                ),
              ])),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ));
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
