
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'Application.dart';
import 'FlRouter.dart';

class FlNavUtils{
  static void goPage1(BuildContext context){

    Application.router.navigateTo(context, FlRoutes.page1,transition: TransitionType.material);
  }
}