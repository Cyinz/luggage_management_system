import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/provide/deposit_provider.dart';
import 'package:luggagemanagementsystem/provide/login_form.dart';
import 'package:luggagemanagementsystem/routers/application.dart';
import 'package:luggagemanagementsystem/routers/routes.dart';
import 'package:provide/provide.dart';

void main() {
  var providers = Providers();
  var loginForm = LoginForm();
  var depositProvider = DepositProvider();
  providers
    ..provide(Provider<LoginForm>.value(loginForm))
    ..provide(Provider<DepositProvider>.value(depositProvider));
  runApp(
    ProviderNode(
      child: MyApp(),
      providers: providers,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化路由
    final router = Router();
    Routes.configureRouters(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: '智能酒店行李管理',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blueGrey),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
