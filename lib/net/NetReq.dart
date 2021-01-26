
import 'package:my_module/models/Album.dart';
import 'package:my_module/net/HttpUtil.dart';

class NetReq{
  static Future<Album> getAlbum() async {
    var result = await HttpUtil().get(
        "https://jsonplaceholder.typicode.com/albums/1");
    return Album.fromMap(result);
  }
}