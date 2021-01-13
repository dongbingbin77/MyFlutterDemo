
import 'package:flutter/material.dart';
import 'package:my_module/models/User.dart';

class FluroPage1 extends StatefulWidget{

  User user ;


  FluroPage1({Key key,this.user}):super(key: key);

  @override
  State createState() {
    return _FluroPage1State(this.user);
  }
}

class _FluroPage1State extends State<FluroPage1>{
  User user = User("1",2);

  _FluroPage1State(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("发送数据"),),
      body: Column(
        children: [
          Text("username: ${user.name}"),
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