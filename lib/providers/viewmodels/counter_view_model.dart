import 'package:my_module/models/Album.dart';
import 'package:my_module/net/NetReq.dart';
import 'package:my_module/providers/enums/new_state.dart';
import 'package:my_module/providers/viewmodels/base_view_model.dart';

class CountViewModel extends BaseViewModel{
  int _count=0;

  Album _album = Album();


  Album get album => _album;



  Future fetchAlbum()async{
    var result = await NetReq.getAlbum();
    print("object");
    _album = result;
    notifyListeners();
  }

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
