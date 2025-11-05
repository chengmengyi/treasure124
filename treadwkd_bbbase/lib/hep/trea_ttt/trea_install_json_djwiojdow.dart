import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_top_json_diwjdow.dart';

class TreaInstallJsonDjwiojdow{
  Future<Map<String,dynamic>> getJson()async{
    var topJson = await TreaTopJsonDiwjdow().getTopJson();
    var referrerMap = await FlutterTbaInfo.instance.getReferrerMap();
    topJson["side"]=referrerMap["build"];
    topJson["madman"]=referrerMap["referrer_url"];
    topJson["squeak"]=referrerMap["install_version"];
    topJson["salivary"]=referrerMap["user_agent"];
    topJson["pushover"]="bushy";
    topJson["wasteful"]=referrerMap["referrer_click_timestamp_seconds"];
    topJson["arterial"]=referrerMap["install_begin_timestamp_seconds"];
    topJson["deputy"]=referrerMap["referrer_click_timestamp_server_seconds"];
    topJson["game"]=referrerMap["install_begin_timestamp_server_seconds"];
    topJson["doff"]=referrerMap["install_first_seconds"];
    topJson["imp"]=referrerMap["last_update_seconds"];
    topJson["zen"]=referrerMap["google_play_instant"];
    topJson["confocal"]="airfare";
    return topJson;
  }
}