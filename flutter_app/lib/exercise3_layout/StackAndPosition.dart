import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

/*
* Stack({
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})
*
* alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。
textDirection：和Row、Wrap的textDirection功能一样，都用于确定alignment对齐的参考系，即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右，即从左往右的顺序；textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左，即从右往左的顺序。
fit：此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
overflow：此属性决定如何显示超出Stack显示空间的子组件；值为Overflow.clip时，超出部分会被剪裁（隐藏），值为Overflow.visible 时则不会。
*
*
*
* const Positioned({
  Key key,
  this.left,
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  @required Widget child,
})
*
*
* Align({
  Key key,
  this.alignment = Alignment.center,
  this.widthFactor,
  this.heightFactor,
  Widget child,
})
*
* */

class WrapAndFlowTestRoute extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Container(
                      child: Text("Hello world",
                          style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                    Positioned(
                      left: 18.0,
                      child: Text("I am Jack"),
                    ),
                    Positioned(
                      top: 18.0,
                      child: Text("Your friend"),
                    )
                  ],
                ),
              ),
              Stack(
                alignment:Alignment.center ,
                fit: StackFit.expand, //未定位widget占满Stack整个空间
                children: <Widget>[
                  Positioned(
                    left: 18.0,
                    child: Text("I am Jack"),
                  ),
                  Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  )
                ],
              ),
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: Align(

                  alignment: Alignment.topRight,
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              )
            ],
          ),
        ));
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

//示例中的Spacer的功能是占用指定比例的空间，实际上它只是Expanded的一个包装类，
// Spacer的源码如下：

class Spacer extends StatelessWidget {
  const Spacer({Key key, this.flex = 1})
      : assert(flex != null),
        assert(flex > 0),
        super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: const SizedBox.shrink(),
    );
  }
}
