import 'package:flutter_android_ad_plugins/data/ad_info_data.dart';
import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_android_ad_plugins/hep/ad_type.dart';
import 'package:flutter_android_ad_plugins/hep/hep.dart';
import 'package:flutter_check_adjust/dio/dio_hep.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_json_djiwjdow.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_header_json_djwidjow.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_install_json_djwiojdow.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_json_dwidhiwjcla.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_top_json_diwjdow.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_url_djowjodw.dart';

class TreaTttIwjodwm {
  static final TreaTttIwjodwm _iwjodwm=TreaTttIwjodwm();
  static TreaTttIwjodwm get instance => _iwjodwm;

  installEventdwjodw({int tryNum=5})async{
    sessionEventdwodjo();
    if(bInstallEvent.getData()){
      return;
    }
    var url = await TreaUrlDjowjodw().getUrl();
    var header = await TreaHeaderJsonDjwidjow().getJson();
    var map = await TreaInstallJsonDjwiojdow().getJson();
    "tba--->install--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: url, data: map,header: header);
    "tba--->install--->result--->${dioResult.success}--->params:$map".log();
    if(dioResult.success){
      bInstallEvent.saveData(true);
    }else{
      if(tryNum>0){
        await Future.delayed(Duration(seconds: 1));
        installEventdwjodw(tryNum: tryNum-1);
      }
    }
  }

  sessionEventdwodjo({int tryNum=5})async{
    var url = await TreaUrlDjowjodw().getUrl();
    var header = await TreaHeaderJsonDjwidjow().getJson();
    var topJson = await TreaTopJsonDiwjdow().getTopJson();
    topJson["confocal"]="excelled";
    "tba--->session--->params--->$topJson".log();
    var dioResult = await DioHep.instance.requestPost(path: url, data: topJson,header: header);
    "tba--->session--->result--->${dioResult.success}--->params:$topJson".log();
    if(!dioResult.success&&tryNum>0){
      await Future.delayed(Duration(seconds: 1));
      sessionEventdwodjo(tryNum: tryNum-1);
    }
  }

  adEventjdiwjio({
    required AdMoneyInfoBean? ad,
    required TreaAdPosIdEnumDwidjwm posId,
    required AdInfoData? adInfoData,
    int tryNum=5,
  })async{
    var url = await TreaUrlDjowjodw().getUrl();
    var header = await TreaHeaderJsonDjwidjow().getJson();
    var map = await TreaAdJsonDjiwjdow().getJson(ad, posId, adInfoData);
    "tba--->ad--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: url, data: map,header: header);
    "tba--->ad--->result--->${dioResult.success}--->params:$map".log();
    if(!dioResult.success&&tryNum>0){
      await Future.delayed(Duration(seconds: 1));
      adEventjdiwjio(ad: ad, posId: posId, adInfoData: adInfoData,tryNum: tryNum-1);
    }
  }

  pointEventdjwijiwo({
    required TreaPointEnumDjwidjo point,
    Map<String,dynamic>? params,
    int tryNum=5,
  })async{
    var url = await TreaUrlDjowjodw().getUrl();
    var header = await TreaHeaderJsonDjwidjow().getJson();
    var map = await TreaPointJsonDwidhiwjcla().getJson(point, params);
    "tba--->ad--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: url, data: map,header: header);
    "tba--->ad--->result--->${dioResult.success}--->params:$map".log();
    if(!dioResult.success&&tryNum>0){
      await Future.delayed(Duration(seconds: 1));
      pointEventdjwijiwo(point: point,params: params,tryNum: tryNum-1);
    }
  }
}