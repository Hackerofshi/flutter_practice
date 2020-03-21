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

    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.green,);

    // TODO: implement build
    return ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return ListTile(title: Text("$index"),);
        },
        separatorBuilder: (BuildContext context,int index){
          return index%2==0?divider1:divider2;
        },
        itemCount: 100
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView>{


  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];


  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, index){
          if(_words[index] == loadingTag){

            if(_words.length -1 <100){
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)
                ),
              );
            }else{
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),),
              );
            }
          }

          return ListTile(title: Text(_words[index]));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
        itemCount: _words.length
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
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
