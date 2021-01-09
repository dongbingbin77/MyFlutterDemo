


import 'package:flutter/material.dart';

import 'package:my_module/ImageDemo.dart';
import 'package:my_module/paramsdemo/ParamDemoSendPage.dart';
import 'package:my_module/paramsdemo/ParamReceiveDemoPage.dart';
//
// Map<String,Widget> getMap(){
//   return {
//     "router2":DemoPage()
//   };
// }


Map<String,WidgetBuilder> getRoutes()=>{
  ParamDemoSendPage.routeName:(BuildContext context) => ParamDemoSendPage(),
  ParamReceiveDemoPage.routeName:(BuildContext context) => ParamReceiveDemoPage(),
  ImageDemo.routerName:(BuildContext context) => ImageDemo(),
};

class Routers{


  Routers._();

  static final _instance = Routers._();

  factory Routers.getInstance() => _instance;
}