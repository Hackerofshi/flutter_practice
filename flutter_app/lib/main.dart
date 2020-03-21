import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/exercise2/testButton.dart';
import 'package:flutter_app/exercise2/testText.dart';
import 'package:flutter_app/testListView.dart';
import 'package:flutter_app/testStateless.dart';

import 'exercise1/route.dart';
import 'exercise2/testCheckBoxAndSwitch.dart';
import 'exercise2/testIconAndImage.dart';
import 'exercise2/testProgressBar.dart';
import 'exercise2/testTextFiled.dart';
import 'exercise3_layout/Box.dart';
import 'exercise3_layout/FlexAndExpandedAndAlign.dart';
import 'exercise8/provider.dart';
import 'exercise9_persistent_eader吸顶/sticky.dart';
import 'login/app.dart';

void main() => runApp(Sticky());





class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: RouterTestRoute(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyApp1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final WordPair = new prefix0.WordPair.random();

    return new MaterialApp(
      title: "Hello",
      home: new Scaffold(
        appBar:new AppBar(
          title: new Text("Hello"),
        ),
        body: new Center(
          child: new Text(WordPair.asPascalCase),
        ),
      ),
    );
  }
}


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();  // 删掉本行

    return new MaterialApp(
      title: 'Welcome to Flutter',
      //你可以通过配置 ThemeData 类轻松更改应用程序的主题，
      // 目前我们的应用程序使用默认主题，下面将更改 primaryColor 颜色为白色。
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords1(),
      /*home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text(wordPair.asPascalCase), // 修改本行内容
          child: new RandomWords1(),                 // 修改成本行代码
        ),
      ),*/
    );
  }
}


class Sticky extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "Hello",
      home: new Scaffold(
        appBar:new AppBar(
          title: new Text("Hello"),
        ),
        body: StickyDemo()
      ),
    );
  }
}


