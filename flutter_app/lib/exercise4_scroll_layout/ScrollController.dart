import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GridView.dart';

class ScrollControllerApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body:
              /*ListView.builder(
              itemCount: 100,
              itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              }),*/
          ScrollControllerTestRoute(),
        ));
  }
}

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() {
    return new ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("$index"),
              );
            }),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }
}





class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar( //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                }
            ),
            CircleAvatar(  //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}

/*
*
* 在接收到滚动事件时，参数类型为ScrollNotification，它包括一个metrics属性，它的类型是ScrollMetrics，该属性包含当前ViewPort及滚动位置等信息：

pixels：当前滚动位置。
maxScrollExtent：最大可滚动长度。
extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。
* */