import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/exerise2/testButton.dart';

class WillPopPage extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: FirstPage(),
    );
  }
}

//flutter: Navigator operation requested with a context that does not include a Navigator.

//把home部分作为一个新的Widget拆出来就可以了。 这样才不会Navigator 不可用
//要使用Navigator，根元素不能是MaterialApp
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        //为 AppBar 的 leading 字段设置一个 IconButton 。
        // （需要将其放在 title 字段前面，因为它们遵循从头至尾 leading-to-trailing 的先后顺序）
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              print('Menu button');
            }),

        //TODO: Add buttons and title (102)
        title: Text('SHRINE'),

        //添加 actions

        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              }),
          //对于 Icon 类，SemanticLabel
          // 通常用于添加无障碍信息
          IconButton(
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Filter button');
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            //悬浮按钮
              child: Icon(Icons.add),
              onPressed: () {
                //导航到新路由
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return WillPopScopeTestRoute();
                    }));
              })
        ],
      ),
    );
  }
}


class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: new WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
            alignment: Alignment.center,
            child: Text("1秒内连续按两次返回键退出"),
          )),
    );
  }
}
