

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeBridge extends StatefulWidget{
  static String routeName = "NativeBridge";

  @override
  State createState() {
    return _NativeBridgeState();
  }
}

class _NativeBridgeState extends State<NativeBridge>{

  String _flutter2NativeResult = "";
  String _native2FlutterResult = "";
  MethodChannel platform = MethodChannel('YJY.FLUTTER');


  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "refreshPage":
        setState(() {
          _native2FlutterResult="refreshPage";
        });
        return "";
        break;
      default:
        return "hello from 211";
    }
  }


  Future<void> _flutterCallNative() async {
    final String result = await platform.invokeMethod('',{
      "path":"botaoota://BTLoginPlugin/login",
      "params":"{'forceLogin':true}",
    });

    setState(() {
      _flutter2NativeResult = result;
    });
  }

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(platformCallHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Native Birdge"),
      ),
      body: Container(
        margin: EdgeInsets.only(top:20),
        child: ListView(
          children:[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: GestureDetector(
                    child: Text("flutter调用原生"),
                    onTap: ()=> _flutterCallNative(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: Text("flutter调用原生 value:$_flutter2NativeResult"),
                ),
                Container(
                  margin: EdgeInsets.only(top:40),
                  child: Text("原生调用Flutter"),
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: Text("原生调用Flutter value:$_native2FlutterResult"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}