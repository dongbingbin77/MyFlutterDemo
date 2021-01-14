
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_module/models/User.dart';
import 'package:my_module/utils/JsonUtils.dart';

import 'Application.dart';
import 'FlRouter.dart';
import 'dart:convert' as convert;


class FlNavUtils{
  static Future goPage1(BuildContext context,{bool clearStack=false}){
    User user = User("董冰彬",123);
    return navigateTo(context, FlRoutes.page1,params: Map.of({"user":user,"name":"董冰彬2","age":123})
        ,clearStackPara: clearStack,transition: TransitionType.material);
  }

  static Future goPage2(BuildContext context,String name) {
    return navigateTo(context, FlRoutes.page2,params:Map.of({"name":name}),transition: TransitionType.material);
  }

  static Future goPage3(BuildContext context) {
    return navigateTo(context, FlRoutes.page3,transition: TransitionType.material);
  }

  static Future goPageList(BuildContext context,{bool clearStack=false}){
    return navigateTo(context, FlRoutes.pageList,clearStackPara: clearStack,transition: TransitionType.material);
  }

  static void pop(BuildContext context,dynamic result){
    Application.router.pop(context,result);
  }


  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
        TransitionType transition = TransitionType.native,
      bool clearStackPara=false}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {

        var value = Uri.encodeComponent(convertModel2Json(params[key]));

        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return Application.router.navigateTo(context, path, transition:transition,clearStack: clearStackPara);
  }
}