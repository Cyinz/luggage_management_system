import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luggagemanagementsystem/provide/login_form.dart';
import 'package:provide/provide.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1980);
    return Scaffold(
      body: Provide<LoginForm>(
        builder: (context, child, loginForm) {
          return SafeArea(
            child: GestureDetector(
              child: _loginForm(context),
              // 点击空白处收回键盘
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
          );
        },
      ),
    );
  }

  //  登陆表单
  Widget _loginForm(BuildContext context) {
    return Form(
      key: Provide.value<LoginForm>(context).loginFormKey,
      child: ListView(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        children: <Widget>[
          _formTitle(),
          _underLine(),
          _userLoginName(context),
          _password(context),
          _forgetPassword(context),
          _loginButton(context),
        ],
      ),
    );
  }

  //  登陆表单标题
  Widget _formTitle() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(300),
      ),
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(120.0),
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  //  标题下划线
  Widget _underLine() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.black,
        height: ScreenUtil().setHeight(8),
        width: ScreenUtil().setWidth(270),
      ),
    );
  }

  //  用户名输入框
  Widget _userLoginName(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(100),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: "请输入用户名",
          helperText: '',
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value.isEmpty) {
            return "用户名不能为空";
          }
        },
        onSaved: (value) {
          Provide.value<LoginForm>(context).saveUserName(value);
        },
      ),
    );
  }

  //  密码输入框
  Widget _password(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.keyboard),
          labelText: "请输入密码",
          helperText: "",
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Provide.value<LoginForm>(context).eyeColor,
            onPressed: () {
              Provide.value<LoginForm>(context).isObscureChange();
            },
          ),
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return "密码不能为空";
          }
        },
        onSaved: (value) {
          Provide.value<LoginForm>(context).savePassword(value);
        },
      ),
    );
  }

  //  忘记密码按钮
  Widget _forgetPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        child: FlatButton(
          onPressed: null,
          child: Text(
            "忘记密码",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(38.0),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  //  登陆按钮
  Widget _loginButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(150),
      ),
      child: RaisedButton(
        color: Colors.black,
        shape: StadiumBorder(),
        child: Text(
          "登陆",
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(60.0),
            fontStyle: FontStyle.italic,
          ),
        ),
        onPressed: () {
          if (Provide.value<LoginForm>(context)
              .loginFormKey
              .currentState
              .validate()) {
            Provide.value<LoginForm>(context).loginFormKey.currentState.save();
            login(Provide.value<LoginForm>(context).username,
                Provide.value<LoginForm>(context).password);
          }
        },
      ),
    );
  }

  //  登陆方法
  login(String username, String password) {
  }
}
