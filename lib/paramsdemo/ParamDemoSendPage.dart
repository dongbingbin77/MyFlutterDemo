import 'package:flutter/material.dart';

import 'ParamReceiveDemoPage.dart';

// ignore: must_be_immutable
class ParamDemoSendPage extends StatefulWidget {
  static String routeName="ParamDemoSendPage";

  @override
  State createState() {
    return _ParamDemoSendPageState();
  }
}

class _ParamDemoSendPageState extends State<ParamDemoSendPage>{

  Map<String,String> _backParam = Map();
  Future<void> _navigateTo() async {
    final args = await Navigator.pushNamed(context, ParamReceiveDemoPage.routeName,arguments:{
      "param1":"param1",
      "param2":"param2",
    });
    _backParam = args;
    setState(() {
      _backParam;
    });

  }
  @override
  Widget build(BuildContext context) {

    ///无需指定MaterialApp，使用的是第一个页面的风格，可指定AppBar
    return Scaffold(
      appBar: AppBar(title: Text("发送数据"),),
      body: Column(
        children: [
          Text("接收数据到下一个页面的回传数据 ${_backParam["a"]}"),
          Container(
            margin: EdgeInsets.only(top:20),
            child: GestureDetector(
              child: Text("传惨到下一个页面"),
              onTap: ()=> _navigateTo(),
            ),
          ),
        ],
      ),
    );
  }
}
