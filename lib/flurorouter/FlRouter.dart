
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:my_module/flurorouter/route_handlers.dart';
import 'package:my_module/providers/provider_page_1.dart';


class FlRoutes {
  static String root = "/";
  static String page1 = "/page1";
  static String page2 = "/page2";
  static String page3 = "/page3";
  static String pageList = "/pageFluroList";
  static String providerPage1 = ProviderPage1.routeName;
  // static String demoParams = "/deme_params";
  // static String returnParams = "/return_params";
  // static String transitionDemo = "/transitionDemo";
  // static String transitionCustomDemo = "/transitionCustomDemo";
  // static String transitionCupertinoDemo = "/transitionCupertinoDemo";

  static void configureRoutes(FluroRouter router) {

    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
    });
    /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画，可以看上图
    /// 我这边先不设置默认的转场动画，转场动画在下面会讲，可以在另外一个地方设置（可以看NavigatorUtil类）
    router.define(root, handler: demoListHandler);
    router.define("/router1", handler: demoListHandler);
    router.define(page1, handler: fluroPage1Handler);
    router.define(page2, handler: fluroPage2Handler);
    router.define(page3, handler: fluroPage3Handler);
    router.define(pageList, handler: fluroPageListHandler);
    router.define(ProviderPage1.routeName, handler: fluroProviderPage1Handler);
    // router.define(home, handler: homeHandler);
    // router.define(demoParams, handler: demoParamHandler);
    // router.define(returnParams, handler: returnParamHandler);
    // router.define(transitionDemo, handler: transitionDemoHandler);
    // router.define(transitionCustomDemo, handler: transitionDemoHandler);
    // router.define(transitionCupertinoDemo, handler: transitionDemoHandler);

  }
}
