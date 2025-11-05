import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_top_json_diwjdow.dart';

class TreaPointJsonDwidhiwjcla{
  Future<Map<String,dynamic>> getJson(TreaPointEnumDjwidjo point,Map<String,dynamic>? map)async{
    var topJson = await TreaTopJsonDiwjdow().getTopJson();
    topJson["confocal"]=point.name;
    if(null!=map) {
      topJson[point.name] = map;
    }
    return topJson;
  }
}