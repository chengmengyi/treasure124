import 'package:flutter_android_ad_plugins/data/ad_info_data.dart';
import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_top_json_diwjdow.dart';

class TreaAdJsonDjiwjdow{
  Future<Map<String,dynamic>> getJson(AdMoneyInfoBean? ad,TreaAdPosIdEnumDwidjwm posId,AdInfoData? adInfoData)async{
    var topJson = await TreaTopJsonDiwjdow().getTopJson();
    topJson["broil"]={
      "kirkland":(ad?.revenue??0)*1000000,
      "mamma":"USD",
      "tracery":ad?.networkName??"",
      "ledge":adInfoData?.adPlat??"",
      "situate":adInfoData?.adId??"",
      "talkie":posId.name,
      "mutiny":adInfoData?.adType.name,
      "monash":ad?.revenuePrecision??"",
    };
    return topJson;
  }
}