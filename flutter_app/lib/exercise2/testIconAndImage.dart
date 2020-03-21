import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

class ImageApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body: SafeArea(
              child: ListView(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            children: <Widget>[
              Image(
                image: AssetImage("assets/diamond.png"),
                width: 100.0,
                height: 100.0,
              ),
              Image.asset(
                "assets/diamond.png",
                width: 100.0,
                height: 100.0,
              ),

              //从网络加载图片
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
                height: 100.0,
              ),
              //Image也提供了一个快捷的构造函数Image.network用于从网络加载、显示图片：
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible,color: Colors.green,),
                  Icon(Icons.error,color: Colors.green,),
                  Icon(Icons.fingerprint,color: Colors.green,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(MyIcons.book,color: Colors.purple,),
                  Icon(MyIcons.wechat,color: Colors.green,),
                ],
              )
            ],
          )),
        ));
  }
}


class ImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img=AssetImage("assets/diamond.png");
    return SingleChildScrollView(
      child: Column(
          children: <Image>[
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.none,
            ),
            Image(
              image: img,
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY ,
            )
          ].map((e){
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: e,
                  ),
                ),
                Text(e.fit.toString())
              ],
            );
          }).toList()
      ),
    );
  }
}



class MyIcons{
  // book 图标
  static const IconData book = const IconData(
      0xe614,
      fontFamily: 'Rubik',
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = const IconData(
      0xec7d,
      fontFamily: 'Rubik',
      matchTextDirection: true
  );
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
