import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

class ScaffoldApp extends StatelessWidget{

  final ThemeData  _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Shrine',
      home: ScaffoldRoute(),
      //在项目的 app.dart 中，调用 initialRoute: '/login' ，
      // 会向 Navigator 添加一个登录界面，将其放到 home 字段所声明的页面之上。
      //theme: _KShrineTheme,
    );
  }
}


/**
 *AppBar({
    Key key,
    this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
    this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
    this.title,// 页面标题
    this.actions, // 导航栏右侧菜单
    this.bottom, // 导航栏底部菜单，通常为Tab按钮组
    this.elevation = 4.0, // 导航栏阴影
    this.centerTitle, //标题是否居中
    this.backgroundColor,
    ...   //其它属性见源码注释
    })
 */

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>   with SingleTickerProviderStateMixin{

  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  int _selectedIndex = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("App Name"),

        //左侧的按钮
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        bottom: TabBar(   //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
      ),
      drawer: new MyDrawer(), //抽屉
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) { //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}



class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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