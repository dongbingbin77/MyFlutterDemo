
import 'dart:convert' as convert;

String convertModel2Json(dynamic model){
  return convert.jsonEncode(model);
}

dynamic convertJson2Model(String json){
  return convert.jsonDecode(json);
}