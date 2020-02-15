import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

/*class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/diamond.png'),
              SizedBox(height: 16.0),
              Text('SHRINE')
            ],
          ),
          SizedBox(height: 120.0,),
        ],
      )
      ),
    );
  }

}*/

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  //为了实现清除文本框内容，我们需要添加 TextEditingControllers 来控制文本。
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
              ],
            ),
            //添加两个新文本框，并通过 SizedBox(height: 120.0) 添加一个空位符。
            SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)
            // TODO: Add button bar (101)
            /*TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Username'),
            ),*/

            //扩展组件
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            /*TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Password'),
              obscureText: true,
            ),*/
            AccentColorOverride(color: kShrineBrown900,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                //我们将使用两种 MDC 按钮 widget ：FlatButton （在 Material Guidelines 中称为 "Text Button" ）
                // 和 RaisedButton （也称 "Contained Button" ）。
                FlatButton(
                    onPressed: () {
                      _userNameController.clear();
                      _passwordController.clear();
                    },
                    child: Text('cancel')),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                //更改 NEXT RaisedButton 的 elevation: 值
                RaisedButton(
                  child: Text('NEXT'),
                  elevation: 8.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(accentColor: color),
    );
  }
}
