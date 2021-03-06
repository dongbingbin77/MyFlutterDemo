import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_module/providers/locator.dart';
import 'package:my_module/providers/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';

import '../base_consumer.dart';

//暂时没有用到
class BaseScreen<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  const BaseScreen({Key key, this.builder, this.onModelReady})
      : super(key: key);

  @override
  _BaseScreenState<T> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends BaseViewModel> extends State<BaseScreen<T>> {
  T model = locator<T>();

  @override
  void initState() {

    if (widget.onModelReady != null) widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_)=>locator<T>(),
      builder: (context,widget) => widget,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}