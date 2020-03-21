/*
* InheritedWidget是Flutter中非常重要的一个功能型组件，它提供了一种数据在widget树中从上到下传递、共享的方式，
* 比如我们在应用的根widget中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget中来获取该共享的数据！
* 这个特性在一些需要在widget树中共享数据的场景中非常方便！如Flutter SDK中正是通过InheritedWidget来共享应用主题
* （Theme）和Locale (当前语言环境)信息的。

InheritedWidget和React中的context功能类似，和逐级传递数据相比，它们能实现组件跨级传递数据。
* InheritedWidget的在widget树中数据传递方向是从上到下的，
* 这和通知Notification（将在下一章中介绍）的传递方向正好相反。*/

import 'package:flutter/material.dart';
import 'package:flutter_app/exercise2/testButton.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
   // return context.inheritFromWidgetOfExactType(ShareDataWidget);
    //在ShareDataWidget发生变化时调用__TestWidgetState的didChangeDependencies()方法应该怎么办？
    // 其实答案很简单，我们只需要将ShareDataWidget.of()的实现改一下即可：
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  // //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }
}

//然后我们实现一个子组件_TestWidget，
// 在其build方法中引用ShareDataWidget中的数据。同时，
// 在其didChangeDependencies() 回调中打印日志：

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() {
    // TODO: implement createState
    return __TestWidgetState();
  }
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context).data.toString());

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

//最后，我们创建一个按钮，每点击一次，就将ShareDataWidget的值自增：


class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ShareDataWidget
        (data: count,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),//子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ) ,),
    );
  }

}


class InheritedWidgetPage extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: _KShrineTheme,
      title: "Hello",
      home: InheritedWidgetTestRoute(),
    );
  }
}