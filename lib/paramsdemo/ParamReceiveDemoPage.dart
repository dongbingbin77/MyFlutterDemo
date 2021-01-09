import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ParamReceiveDemoPage extends StatelessWidget {
  static String routeName="ParamReceiveDemoPage";

  String param1="1";
  String param2="1";


  @override
  Widget build(BuildContext context) {
    Map<String,String> args = ModalRoute.of(context).settings.arguments;
    if(args==null){
      args = {};
    }
    ///无需指定MaterialApp，使用的是第一个页面的风格，可指定AppBar
    return Scaffold(
      appBar: AppBar(title: Text("第二个页面 ${args['param1']}"),),
      body: Column(
        children: [
          Text("第二个页面 ${args['param2']}"),

          TextButton(
            child: Text("返回"),
            onPressed: (){
            Navigator.of(context).pop({"a":" 返回参数 ss"});
          },
          ),

        ],
      ),
    );
  }
}
