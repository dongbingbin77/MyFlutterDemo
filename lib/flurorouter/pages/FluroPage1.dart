
import 'package:flutter/material.dart';

class FluroPage1 extends StatefulWidget{

  @override
  State createState() {
    return _FluroPage1State();
  }
}

class _FluroPage1State extends State<FluroPage1>{
  Map<String,String> _backParam = Map();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("发送数据"),),
      body: Column(
        children: [
          Text("接收数据到下一个页面的回传数据 ${_backParam["a"]}"),
          Container(
            margin: EdgeInsets.only(top:20),
            child: GestureDetector(
              child: Text("传惨到下一个页面"),
              onTap: ()=> {},
            ),
          ),
        ],
      ),
    );
  }
}