import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:luggagemanagementsystem/pages/index_page.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});