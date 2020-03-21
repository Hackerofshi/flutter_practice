import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/exercise2/testButton.dart';

class DialogApp extends StatelessWidget {
  final ThemeData _KShrineTheme = buildShrineTheme();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: _KShrineTheme,
        title: "Hello",
        home: DialogRoute()
    );
  }
}

class DialogRoute extends StatefulWidget {
  @override
  _DialogRouteState createState() => _DialogRouteState();
}

class _DialogRouteState extends State<DialogRoute> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        RaisedButton(
          child: Text("normal"),
          onPressed: () async {
            //弹出对话框并等待其关闭
            bool delete = await showDeleteConfirmDialog1();
            if (delete == null) {
              print("取消删除");
            } else {
              print("已确认删除");
              //... 删除文件
            }
          },
        ),

        //FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
        FlatButton(
          child: Text("normal"),
          onPressed: () {},
        ),
        //OutlineButton默认有一个边框，不带阴影且背景透明。按下后，
        // 边框颜色会变亮、同时出现背景和阴影(较弱)，
        OutlineButton(
          child: Text("normal"),
          onPressed: () {},
        ),
        //IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
      ]),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
