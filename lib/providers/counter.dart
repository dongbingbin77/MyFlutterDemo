import 'package:flutter/material.dart';
import 'package:my_module/providers/enums/new_state.dart';

class Counter with ChangeNotifier {//1
  int _count;
  ViewState _viewState = ViewState.IDLE;
  Counter(this._count);

  Future add() async {
    setState(ViewState.BUSY);
    await Future.delayed(Duration(seconds: 3));
    setState(ViewState.IDLE);
    _count++;
    notifyListeners();//2

  }

  setState(ViewState viewState){
    _viewState = viewState;
    notifyListeners();
  }

  Future reduce() async {
    setState(ViewState.BUSY);
    await Future.delayed(Duration(seconds: 3));
    setState(ViewState.IDLE);
    _count=_count-1;
    notifyListeners();
  }


  get viewState => _viewState;

  get count => _count;//3
}