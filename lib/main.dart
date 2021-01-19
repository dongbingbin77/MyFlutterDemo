import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:my_module/paramsdemo/ParamReceiveDemoPage.dart';
import 'package:my_module/providers/locator.dart';

import 'package:my_module/utils/Routers.dart';

import 'DemoListPage.dart';
import 'flurorouter/Application.dart';
import 'flurorouter/FlRouter.dart';
import 'models/User.dart';
void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  Application.router = FluroRouter();
  setupLoader();
  FlRoutes.configureRoutes(Application.router);
  switch (route) {
    case 'route1':
      return MyApp();
    case 'route2':
      return MyApp();
    default:
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: getRoutes(),
      title: 'Flutter Demo',
      onGenerateRoute: FluroRouter.appRouter.generator,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
       home:DemoListPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Map<String,dynamic> _user;
  String _batteryLevel = 'Unknown battery level.';
  String _loginInfo="";
  Map<String,String> _backParam = Map();
  static const platform = const MethodChannel('YJY.FLUTTER');
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    _getBatteryLevel();
  }

  Map<String,dynamic> _testApi(){
    User user = User("dongbingbin",1);
    return user.toJson();
  }

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(platformCallHandler);
  }

  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "getName":
        return "Hello from Flutter";
        break;
      case "backPressed":

        Navigator.pop(context);
        return "Hello from Flutter dongbingbin";
        break;
      case "refreshPage":
        setState(() {
          _counter++;
        });
        return "";
        break;
      default:
        return "hello from 211";

    }
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final String result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _counter++;
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _navigateTo() async {
    // Navigator.pushNamed(context, "route2");
    // Navigator.push(context, MaterialPageRoute(builder: (_) {
    //   return new DemoPage();
    // }));
    final args = await Navigator.pushNamed(context, ParamReceiveDemoPage.routeName,arguments:{
      "param1":"param1",
      "param2":"param2",
    });
    _backParam = args;
    setState(() {
      _backParam;
    });

  }

  Future<void> _login() async{
    final String result = await platform.invokeMethod('',{
      "path":"botaoota://BTLoginPlugin/login",
      "params":"{'forceLogin':true}",
    });
    
    Map<String,dynamic> user = _testApi();
    setState(() {
      _loginInfo = result;
      _user = user;
    });
  }
/*一个渐变颜色的正方形集合*/
  List<Widget> Boxs() => List.generate(10, (index) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.orangeAccent,
          Colors.orange,
          Colors.deepOrange
        ]),
      ),
      child: Text(
        "${index}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  });
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children:[buildCenter(context),],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Center buildCenter(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '111You have pushed the button this many times111:',
            ),
            Text(
              '$_counter >> $_batteryLevel>>$_user',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_loginInfo'
            ),
            TextButton(
              onPressed: _login,
              child: Text("TextButton按钮"),
            ),
            TextButton(
              onPressed: (){
                _navigateTo();
              },
              child: Text("跳转${_backParam["a"]}"),
            ),
            Wrap(
              spacing: 20, //主轴上子控件的间距
              runSpacing: 5, //交叉轴上子控件之间的间距
              children: Boxs(), //要显示的子控件集合
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color:Colors.brown,
                    child: Text("333jkhjhkjhkh"),
                  ),

                  Container(
                      color:Colors.yellow,
                      child: Text("333jkhjhkjhkhjjj")
                  ),
                ],
              ),
            ),
            Image.asset(
              'images/ic_launcher.png',
            ),
            Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fshanxiji.sinaimg.cn%2F2013%2F0325%2FU8767P1335DT20130325162800.jpg&refer=http%3A%2F%2Fshanxiji.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612802424&t=98b0b31d9eaff2f4754e60a949936683"),

          ],
        ),
      ),
    );
  }
}
