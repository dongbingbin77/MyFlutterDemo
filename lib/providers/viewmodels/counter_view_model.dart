import 'package:my_module/providers/enums/new_state.dart';
import 'package:my_module/providers/viewmodels/base_view_model.dart';

class CountViewModel extends BaseViewModel{
  int _count=0;

  Future add() async {
    setState(ViewState.BUSY);
    await Future.delayed(Duration(seconds: 3));
    setState(ViewState.IDLE);
    _count++;
    notifyListeners();//2
  }

  Future reduce() async {
    setState(ViewState.BUSY);
    await Future.delayed(Duration(seconds: 3));
    setState(ViewState.IDLE);
    _count=_count-1;
    notifyListeners();
  }

  int get count => _count;
}
