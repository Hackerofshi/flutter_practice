import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/colors.dart';

/**
 * BoxConstraints
    BoxConstraints用于设置限制条件，它的定义如下：

    const BoxConstraints({
    this.minWidth = 0.0, //最小宽度
    this.maxWidth = double.infinity, //最大宽度
    this.minHeight = 0.0, //最小高度
    this.maxHeight = double.infinity //最大高度
    })

    BoxDecoration({
    Color color, //颜色
    DecorationImage image,//图片
    BoxBorder border, //边框
    BorderRadiusGeometry borderRadius, //圆角
    List<BoxShadow> boxShadow, //阴影,可以指定多个
    Gradient gradient, //渐变
    BlendMode backgroundBlendMode, //背景混合模式
    BoxShape shape = BoxShape.rectangle, //形状
    })

 */
class BoxTestRoute extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: Scaffold(
          body:    Column(
            children: <Widget>[
              //Flex的两个子widget按1：2来占据水平空间
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                ),
                child: Container(
                    height: 5.0,
                    child: redBox
                ),
              ),

              SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: redBox
              ),
              //实际上SizedBox只是ConstrainedBox的一个定制，上面代码等价于：
              ConstrainedBox(
                //BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,
                // maxWidth: 80.0)
                constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
                child: redBox,
              ),

              //通过上面示例，我们发现有多重限制时，对于minWidth和minHeight来说，
              // 是取父子中相应数值较大的。
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                    child: redBox,
                  )
              ),

              DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                      borderRadius: BorderRadius.circular(3.0), //3像素圆角
                      boxShadow: [ //阴影
                        BoxShadow(
                            color:Colors.black54,
                            offset: Offset(2.0,2.0),
                            blurRadius: 4.0
                        )
                      ]
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text("Login", style: TextStyle(color: Colors.white),),
                  )
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
