import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'dart:async';

//void main() => runApp(MyApp());

class MyAppRoute extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppRoute> {
  @override
  Widget build(BuildContext context) {
    //如果状态管理放在顶层 MaterialApp 之上，它的作用域是全局，任何界面都可以获取;
    return Provider<CountBloc>(
      builder: (context) => CountBloc(),
      //dispose:在widget销毁的时候调用，方便关闭stream，可以防止内存泄露
      //特别是在在StatelessWidget中使用非常好，因为StatelessWidget没有dispose方法
      dispose: (context, value) => value.dispose(),
      child: MaterialApp(
        title: "provider",
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: StreamBuilder(
          stream: Provider.of<CountBloc>(context).stream,
          initialData: 0,
          builder: (context, snapshot) {
            return Center(child: Text("${snapshot.data}"));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    CountBloc bloc = Provider.of<CountBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("第二页")),
      body: StreamBuilder(
          stream: bloc.stream,
          initialData: bloc.count,
          builder: (context, snapshot) {
            return Center(child: Text("${snapshot.data}"));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(),
        child: Icon(Icons.add),
      ),
    );
  }
}


class CountBloc {
  final StreamController<int> _countController = StreamController();
  int count = 0;
  Stream<int> stream;

  CountBloc() {
    stream = _countController.stream.asBroadcastStream();
  }

  add() {
    _countController.add(++count);
  }

  //关闭
  dispose() {
    _countController?.close();
  }
}