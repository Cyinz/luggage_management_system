import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:luggagemanagementsystem/pages/index_page.dart';
import 'package:luggagemanagementsystem/routers/application.dart';
import 'package:luggagemanagementsystem/routers/routes.dart';

void main() => runApp(MyApp());

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
