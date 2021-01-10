
import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget{
  static String routerName="imageDemo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Demo"),
      ),
      body: ListView(
        children: [
            Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:0),
                  child: Text("asset图片 repeat"),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),

                  child: Image.asset(
                    "images/ic_launcher.png",
                    height: 400,
                    width:400,
                    repeat: ImageRepeat.repeat,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:0),
                  child: Text("asset图片 norepeat"),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),

                  child: Image.asset(
                    "images/ic_launcher.png",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:0),
                  child: Text("net 图片"),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fshanxiji.sinaimg.cn%2F2013%2F0325%2FU8767P1335DT20130325162800.jpg&refer=http%3A%2F%2Fshanxiji.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612802424&t=98b0b31d9eaff2f4754e60a949936683"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}