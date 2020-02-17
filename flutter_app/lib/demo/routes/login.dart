import 'dart:convert';

import 'package:flutter_app/demo/common/git_api1.dart';
import 'package:flutter_app/demo/common/result_data.dart';
import 'package:flutter_app/demo/common/rsautils.dart';
import 'package:flutter_app/demo/models/loginbean.dart';
import 'package:flutter_app/demo/states/profile_change_notifier.dart';

import '../index.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  bool pwdShow = false;
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    _unameController.text = Global.profile.lastLogin;
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(gm.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(children: <Widget>[
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: gm.userName,
                    hintText: gm.userName,
                    prefixIcon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().isNotEmpty ? null : gm.userNameRequired;
                },
              ),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: gm.password,
                    hintText: gm.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        })),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : gm.passwordRequired;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    child: Text(gm.login),
                  ),
                ),
              )
            ])),
      ),
    );
  }

  void _onLogin() async {
    // 先验证各个表单字段是否合法



    if ((_formKey.currentState as FormState).validate()) {
      showLoading(context);
      User user;

      login();



      /*try {
        user = await Git(context)
            .login(_unameController.text, _pwdController.text);

        String json1 =  json.encode(user);

        print(json1);

        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {
          showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
        }  else {
          showToast(e.toString());
        }
      } finally {
        // 隐藏loading框
        Navigator.of(context).pop();
      }

      if (user != null) {
        // 返回
        Navigator.of(context).pop();
      }*/
    }
  }

  void login() async {

    Loginbean loginbean = Loginbean();

    loginbean.password = await Encrypt.encrypt(_pwdController.text);
    loginbean.username = _unameController.text;


    try {
      ResultData  str = await Git1(context)
              .login1(loginbean: loginbean);
      print("---"+str.data);
    } catch (e) {
      //登录失败则提示
      if (e.response?.statusCode == 401) {
        showToast(GmLocalizations.of(context).userNameOrPasswordWrong);
      }  else {
        showToast(e.toString());
      }
    } finally {
      // 隐藏loading框
      Navigator.of(context).pop();
    }
  }
}
