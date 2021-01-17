import 'package:flutter/widgets.dart';
import 'package:my_module/providers/enums/new_state.dart';

////暂时没有用到
class BaseViewModel extends ChangeNotifier {

  ViewState _state = ViewState.IDLE;

  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }

}