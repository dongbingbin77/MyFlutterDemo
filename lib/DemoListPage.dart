
import 'package:flutter/material.dart';
import 'package:my_module/ImageDemo.dart';
import 'package:my_module/NativeBridge.dart';
import 'package:my_module/paramsdemo/ParamDemoSendPage.dart';

import 'flurorouter/FlNavUtils.dart';

class DemoListPage extends StatelessWidget{

  _navigateTo(BuildContext context,String routeName){
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Demo List")
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(

              margin: EdgeInsets.only(top:20),
              child: GestureDetector(
                child: Text("图片demo"),
                onTap:()=> _navigateTo(context,ImageDemo.routerName),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              child: GestureDetector(
                child: Text("页面传惨实例"),
                onTap:()=> _navigateTo(context,ParamDemoSendPage.routeName),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              child: GestureDetector(
                child: Text("native bridge"),
                onTap:()=> _navigateTo(context,NativeBridge.routeName),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:20),
              child: GestureDetector(
                child: Text("Fluro router"),
                onTap:()=> FlNavUtils.goPage1(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}