
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_module/DemoListPage.dart';
import 'package:my_module/flurorouter/pages/FluroPage1.dart';
import 'package:my_module/flurorouter/pages/FluroPage2.dart';
import 'package:my_module/flurorouter/pages/FluroPage3.dart';
import 'package:my_module/flurorouter/pages/FluroPageList.dart';
import 'package:my_module/models/User.dart';
import 'package:my_module/providers/provider_page_1.dart';
import 'package:my_module/providers/provider_page_viewmodel.dart';
import 'dart:convert' as convert;

import 'package:my_module/utils/JsonUtils.dart';

var demoListHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return DemoListPage();
});


var fluroPage1Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('fluroPage1Handler');

   User user1 = User.fromJson(convertJson2Model(params["user"][0]));
  // User.fromJson(params)
  return FluroPage1(user:user1);
});


var fluroPage2Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('fluroPage2Handler ${convertModel2Json(params)}');
  return FluroPage2(convertJson2Model(params["name"][0]));
});



var fluroPage3Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //print('fluroPage3Handler ${convertModel2Json(params)}');
  return FluroPage3();
});

var fluroPageListHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('fluroPageListHandler');
  return FluroPageList();
});


var fluroProviderPage1Handler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('fluroProviderPage1Handler');
  return ProviderPage1();
});


var fluroProviderPageViewModelHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print('fluroProviderPageViewModelHandler');
  return ProviderPageViewModel();
});