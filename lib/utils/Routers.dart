


import 'package:flutter/material.dart';

import 'package:my_module/ImageDemo.dart';
import 'package:my_module/NativeBridge.dart';
import 'package:my_module/paramsdemo/ParamDemoSendPage.dart';
import 'package:my_module/paramsdemo/ParamReceiveDemoPage.dart';
import 'package:my_module/providers/provider_page_1.dart';
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
  NativeBridge.routeName:(BuildContext context) => NativeBridge(),
  // ProviderPage1.routeName:(BuildContext context) => ProviderPage1(),
};

class Routers{


  Routers._();

  static final _instance = Routers._();

  factory Routers.getInstance() => _instance;
}