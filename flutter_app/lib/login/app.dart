import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';


import 'home.dart';
import 'login.dart';


//import 'supplemental/cut_corners_border.dart';
//依旧在 app.dart 中，为文本框主题添加带有切角形状的样式：
//
//// TODO: Decorate the inputs (103)
//inputDecorationTheme: InputDecorationTheme(
//  border: CutCornersBorder(), // Replace code
//),
//更改登录界面的按钮
//在 login.dart 文件中，在 CANCEL 按钮上添加斜角矩形边框：
//
//FlatButton(
//  child: Text('CANCEL'),
//
//  shape: BeveledRectangleBorder(
//    borderRadius: BorderRadius.all(Radius.circular(7.0)),
//  ),
//FlatButton 默认没有边框，那为什么我们还要添加边框样式呢？因为在触摸时，它会出现这个形状的波纹动画。
//
//在 NEXT 按钮中添加相同的形状样式：
//
//RaisedButton(
//  child: Text('NEXT'),
//  elevation: 8.0,
//  shape: BeveledRectangleBorder(
//    borderRadius: BorderRadius.all(Radius.circular(7.0)),
//  ),


class ShrineApp extends StatelessWidget{

  final ThemeData  _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Shrine',
      home: new HomePage(),
      //在项目的 app.dart 中，调用 initialRoute: '/login' ，
      // 会向 Navigator 添加一个登录界面，将其放到 home 字段所声明的页面之上。
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      //theme: _KShrineTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings){
    if(settings.name !='/login'){
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context)=>LoginPage(),
      fullscreenDialog: true,
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

    //字体的主题

    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),

    //使用自定义的主图标主题
    //在 _buildShrineTheme() 函数中添加以下代码：
    // TODO: Add the icon theme (103)
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
    ),

    // TODO: Decorate the inputs (103)

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

// TODO: Build a Shrine Text Theme (103)
//这将创建一个 TextTheme，并更改其标题和标题的外观。
//
//之后通过 apply() 的方式设置 fontFamily，将只会影响调用过 copyWith()
// 的属性（这里包括 headline，title，caption）。
//
//对于某些字体来说，我们将设置一些自定义的字重。
// FontWeight widget 提供了非常便捷的方法，
// w500（字重为 500）通常代表中等加粗，而 w400 则代表正常显示的字体。

//字体排版（Typography）注意事项：
//
//使用小号字体和正文字体时，你需要更重视选择清晰的字体，而不是坚持使用某种样式；
//超大的字体往往是用来强调你的品牌的。
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}