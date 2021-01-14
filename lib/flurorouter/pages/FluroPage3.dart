import 'package:flutter/material.dart';
import 'package:my_module/flurorouter/FlNavUtils.dart';
import 'package:my_module/flurorouter/pages/FluroPage1.dart';

import '../FlRouter.dart';

class FluroPage3 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluroPage3"),
      ),
      body: Container(
        margin: EdgeInsets.only(top:30),
        child: TextButton(
          onPressed: (){
            //FlNavUtils.goPage1(context,clearStack: true);
            Navigator.of(context).popUntil((route) => route.settings.name==FlRoutes.pageList);
          },
          child: Text("返回page1"),
        ),
      ),
    );
  }
}