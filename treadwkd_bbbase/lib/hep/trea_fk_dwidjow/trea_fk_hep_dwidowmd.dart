import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
import 'package:flutter_check_adjust/dio/dio_hep.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:trea_feng/trea_feng.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_fk_dwidjow/tre_fk_bean_fowjdow.dart';
import 'package:treadwkd_bbbase/hep/trea_fk_dwidjow/trea_fk_tag_dhwiudow.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';

class TreaFkHepDwidowmd {
  static final TreaFkHepDwidowmd _dwidowmd=TreaFkHepDwidowmd();
  static TreaFkHepDwidowmd get instance => _dwidowmd;

  var _smSuccess=false,_ipSuccess=false;
  TreFkBeanFowjdow? _fkBeanFowjdow;

  initFk()async{
    if(_smSuccess&&_ipSuccess){
      return;
    }
    try{
      var data = bFkConfig.getData();
      if(data.isEmpty){
        data=TreaLocalDjwidj.localFkStrBase64.base64();
      }
      print("kk====initFk=${data}");
      _fkBeanFowjdow=TreFkBeanFowjdow.fromJson(jsonDecode(data));
    }catch(e){
      _fkBeanFowjdow=TreFkBeanFowjdow.fromJson(jsonDecode(TreaLocalDjwidj.localFkStrBase64.base64()));
    }
    FlutterAndroidAdPlugins.instance.setEverydayWatchAdNum(_fkBeanFowjdow?.behavior?.adDailyShow??60);

    //root
    var roTreafeiimwoot = await TreaFeng.instance.roTreafeiimwoot();
    _uploadFkCustomData({TreaFkTagDhwiudow.root.name:roTreafeiimwoot?1:0});
    if(roTreafeiimwoot&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.root)){
      _saveFkTagToLocal(TreaFkTagDhwiudow.root);
    }

    //vpn
    var vpTreafeiimwon = await TreaFeng.instance.vpTreafeiimwon();
    _uploadFkCustomData({TreaFkTagDhwiudow.vpn.name:vpTreafeiimwon?1:0});
    if(vpTreafeiimwon&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.vpn)){
      _saveFkTagToLocal(TreaFkTagDhwiudow.vpn);
    }
    //sim
    var siTreafeiimwom = await TreaFeng.instance.siTreafeiimwom();
    _uploadFkCustomData({TreaFkTagDhwiudow.sim.name:siTreafeiimwom?1:0});
    if(!siTreafeiimwom&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.sim)){
      _saveFkTagToLocal(TreaFkTagDhwiudow.sim);
    }
    //simulator
    var siTreafeiimwomulator = await TreaFeng.instance.siTreafeiimwomulator();
    _uploadFkCustomData({TreaFkTagDhwiudow.simulator.name:siTreafeiimwomulator?1:0});
    if(siTreafeiimwomulator&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.simulator)){
      _saveFkTagToLocal(TreaFkTagDhwiudow.simulator);
    }
    //developer
    var deTreafeiimwoveloper = await TreaFeng.instance.deTreafeiimwoveloper();
    _uploadFkCustomData({TreaFkTagDhwiudow.developer.name:deTreafeiimwoveloper?1:0});
    if(deTreafeiimwoveloper&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.developer)){
      _saveFkTagToLocal(TreaFkTagDhwiudow.developer);
    }
    //store
    var stTreafeiimwoore = await TreaFeng.instance.stTreafeiimwoore();
    _uploadFkCustomData({TreaFkTagDhwiudow.googleplay.name:stTreafeiimwoore?1:0});
    if(!stTreafeiimwoore&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.googleplay)){
      _saveFkTagToLocal(TreaFkTagDhwiudow.googleplay);
    }
    //sm
    var treafeiimwoNumberUnitID = await TreaFeng.instance.getTreafeiimwoNumberUnitID();
    var smDioResult = await DioHep.instance.requestPost(
      path: "https://sg-ddi.shuzilm.cn/q",
      data: {"protocol":2,"pkg":await FlutterTbaInfo.instance.getBundleId(),"did":treafeiimwoNumberUnitID},
    );
    print("kk===sm===${smDioResult.success}===${smDioResult.msg}");
    if(smDioResult.success){
      try{
        _smSuccess=true;
        var json = jsonDecode(smDioResult.msg);
        if(json["err"]==0&&json["device_type"]!=0&&_fkBeanFowjdow?.ui?.number==1){
          _saveFkTagToLocal(TreaFkTagDhwiudow.number);
        }else{

        }
      }catch(e){

      }
    }

    //ip
    var ipDioResult = await DioHep.instance.requestPost(
      path: "https://ip-prod.scratchluckytreasure.com/api/cbat",
      data: {
        "abird":await FlutterTbaInfo.instance.getAndroidId(),
      },
    );
    if(ipDioResult.success){
      try{
        _ipSuccess=true;
        var result = decrypt(ipDioResult.msg, 25);
        print("kk===ip===${result}===");
        var bdog = jsonDecode(result)["data"]["bdog"];
        if(bdog&&_fkBeanFowjdow?.ui?.device!=0&&_checkDevice(TreaFkTagDhwiudow.ip)){
          _saveFkTagToLocal(TreaFkTagDhwiudow.number);
        }
      }catch(e){}
    }
  }

  bool checkHasFk(){
    // if(kDebugMode){
    //   return false;
    // }
    var data = bHasFkLocalTag.getData();
    if(data.isNotEmpty){
      var tagDhwiudow = TreaFkTagDhwiudow.values.byName(data);
      _saveFkTagToLocal(tagDhwiudow);
      return true;
    }
    if(_fkBeanFowjdow?.ui?.behavior!=1){
      return false;
    }
    if(_twoRewardAdTimeSoSmalldwidwo()){
      _saveFkTagToLocal(TreaFkTagDhwiudow.ad_short_show);
      return true;
    }
    if(_watchAdTimeSoSmallfwidhiwn()){
      _saveFkTagToLocal(TreaFkTagDhwiudow.ad_short_close);
      return true;
    }
    if(treaCashMoneyAdLessdwidow.getData()){
      _saveFkTagToLocal(TreaFkTagDhwiudow.wrong_deem_ad_less);
      return true;
    }
    if(treaCashMoneyAdMoredwidjow.getData()){
      _saveFkTagToLocal(TreaFkTagDhwiudow.wrong_deem_ad_more);
      return true;
    }
    return false;
  }

  _saveFkTagToLocal(TreaFkTagDhwiudow tag){
    bHasFkLocalTag.saveData(tag.name);
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.risk_chance,params: {"risk_from":tag.name});
  }

  _uploadFkCustomData(Map<String,dynamic> map){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.session_custom,params: map);
  }

  bool _checkDevice(TreaFkTagDhwiudow tag)=>_fkBeanFowjdow?.device?.contains(tag.name)==true;

  bool _twoRewardAdTimeSoSmalldwidwo(){
    var data = treaTwoRewardAdTimeSoSmalldwodow.getData();
    var i = getAdShortShowSijoq()?.value??3;
    return data>=i;
  }

  bool _watchAdTimeSoSmallfwidhiwn(){
    var data = treaWatchAdTimeSoSmalldjwijdi.getData();
    var i = getAdShortCloseDIWJEIWJ()?.value??3;
    return data>=i;
  }

  AdShortShow? getAdShortShowSijoq()=>_fkBeanFowjdow?.behavior?.adShortShow;

  AdShortClose? getAdShortCloseDIWJEIWJ()=>_fkBeanFowjdow?.behavior?.adShortClose;

  int getAdLessdjwokdowo()=>_fkBeanFowjdow?.behavior?.wrongDeemAdLess??3;

  int getAdMorewidjwo()=>_fkBeanFowjdow?.behavior?.wrongDeemAdMore??90;
}