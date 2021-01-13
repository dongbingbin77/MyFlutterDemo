import 'package:flutter/material.dart';
import 'package:my_module/flurorouter/FlNavUtils.dart';

class FluroPageList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluroPageList"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top:20),
                child: TextButton(
                  onPressed: (){
                    FlNavUtils.goPage1(context);
                  }
                  ,
                  child: Text("传惨跳转"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}