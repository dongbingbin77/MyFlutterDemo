
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_module/models/User.dart';

import 'Application.dart';
import 'FlRouter.dart';
import 'dart:convert' as convert;


class FlNavUtils{
  static void goPage1(BuildContext context){
    User user = User("董冰彬",123);
    navigateTo(context, FlRoutes.page1,params: Map.of({"user":user}),transition: TransitionType.cupertino);
  }

  static void goPage2(BuildContext context){
    navigateTo(context, FlRoutes.page2,transition: TransitionType.cupertino);
  }

  static void goPageList(BuildContext context){

    navigateTo(context, FlRoutes.pageList,transition: TransitionType.cupertino);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(convert.jsonEncode(params[key]));
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
    return Application.router.navigateTo(context, path, transition:transition);
  }
}