import 'package:get_it/get_it.dart';
import 'package:my_module/providers/viewmodels/counter_view_model.dart';

var locator = GetIt.instance;
////暂时没有用到
void setupLoader(){
  //locator.registerFactory(() => null)
  locator.registerFactory(() => CountViewModel());
}