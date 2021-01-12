
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_module/DemoListPage.dart';
import 'package:my_module/flurorouter/pages/FluroPage1.dart';

var demoListHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return DemoListPage();
});


var fluroPage1Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('fluroPage1Handler');
  return FluroPage1();
});