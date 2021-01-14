
import 'package:flutter/material.dart';
import 'package:my_module/flurorouter/FlNavUtils.dart';

class FluroPage2 extends StatefulWidget{

  String name;


  FluroPage2(this.name);

  @override
  State createState() {
    return _FluroPage2State(this.name);
  }
}

class _FluroPage2State extends State<FluroPage2>{
  String name;

  _FluroPage2State(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("发送数据"),),
      body: Column(
        children: [
          Text("上一个页面传送过来的数据 ${this.name}"),
          Container(
            margin: EdgeInsets.only(top:20),
            child: GestureDetector(
              child: Text("传参到前一个页面"),
              onTap: ()=> {
                FlNavUtils.pop(context, "123")
              },
            ),
          ),
        ],
      ),
    );
  }
}