
import 'package:flutter/material.dart';
import 'package:my_module/flurorouter/FlNavUtils.dart';
import 'package:my_module/models/User.dart';
import 'package:my_module/utils/JsonUtils.dart';

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
  String backParams = "";
  _FluroPage1State(this.user);

  Future<void> _navigateToPage2() async {
    print("pop ");

    backParams = await FlNavUtils.goPage2(context,"董冰彬8");
    setState(() {
      backParams;
    });
    print("pop ${backParams}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("发送数据"),),
      body: Column(
        children: [
          Text("username: ${user.name}"),
          Text(
              "上个页面回传参数: $backParams",
          ),
          Container(
            margin: EdgeInsets.only(top:20),
            child: GestureDetector(
              child: Text("传参到下一个页面"),
              onTap: () {
                _navigateToPage2();
              },
            ),
          ),
        ],
      ),
    );
  }
}