import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

/*
* ListView({
  ...
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数
  double itemExtent,
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
*
* */

class ListViewApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body: /*ListView.builder(
              itemCount: 100,
              itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              }),*/
          ListView3(),
        ));
  }
}


class ListView3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
        ),
        children:<Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ]
    );
  }
}


class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
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
