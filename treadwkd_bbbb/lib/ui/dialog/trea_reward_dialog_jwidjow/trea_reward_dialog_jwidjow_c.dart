import 'dart:async';

import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_network_dialog_dwijow/trea_no_network_dialog_dwijow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';

class TreaRewardDialogJwidjowC extends TreaFaC{
  double reward;
  TreaRewardEnum rewardEnum;
  String? playType;
  Function() dismissCallback;

  var showSingle=false;
  Timer? _timer;
  TreaRewardDialogJwidjowC({
    required this.reward,
    required this.playType,
    required this.rewardEnum,
    required this.dismissCallback,
  });

  @override
  void onInit() {
    super.onInit();
    if(TreaGuideHepDwidmow.instance.checkIsStep3()){
      TreaGuideHepDwidmow.instance.uploadUserGuideShowTbaPoint("pop3");
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: isBigReward()?TreaPointEnumDjwidjo.coin_pop_s:TreaPointEnumDjwidjo.coin_pop_b,params: _getTbaParams(),);
  }

  @override
  void onReady() {
    super.onReady();
    _checkShowSingle();
  }

  bool isBigReward()=>reward>=40;

  clickDouble()async{
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.coin_pop_d,params: _getTbaParams(),);
    List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      TreaAdHepNwidiow.instance.showAdndiwjdow(
        adType: AdType.reward,
        showAd: TreaValueHepJomeoc.instance.showAd(AdType.reward),
        adPosId: _getDoubleAdPosId(),
        closeAd: (give){
          TreaRouDwjidw.backdwhudie();
          if(give){
            TreaUserInfoHepDwidhiw.instance.updateMyMoney(doubleDecimal(reward));
          }
          dismissCallback.call();
        },
      );
    }else{
      TreaRouDwjidw.showDdjwidjow(child: TreaNoNetworkDialogDwijow(),);
    }
  }

  clickSingle(){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: isBigReward()?TreaPointEnumDjwidjo.coin_pop_bclaim:TreaPointEnumDjwidjo.coin_pop_sclaim,params: _getTbaParams(),);
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      adType: AdType.interstitial,
      showAd: TreaValueHepJomeoc.instance.showAd(AdType.interstitial),
      adPosId: _getSingleAdPosId(),
      closeAd: (give){
        TreaRouDwjidw.backdwhudie();
        if(give){
          TreaUserInfoHepDwidhiw.instance.updateMyMoney(reward);
        }
        dismissCallback.call();
      },
    );
  }

  TreaAdPosIdEnumDwidjwm _getSingleAdPosId(){
    switch(rewardEnum){
      case TreaRewardEnum.box: return TreaAdPosIdEnumDwidjwm.ytmcp_box_int;
      case TreaRewardEnum.wheel: return TreaAdPosIdEnumDwidjwm.ytmcp_wheelpop_int;
      case TreaRewardEnum.lucky: return TreaAdPosIdEnumDwidjwm.ytmcp_flop_int;
      case TreaRewardEnum.card: return TreaAdPosIdEnumDwidjwm.ytmcp_srcpop_int;
    }
  }

  TreaAdPosIdEnumDwidjwm _getDoubleAdPosId(){
    switch(rewardEnum){
      case TreaRewardEnum.box: return TreaAdPosIdEnumDwidjwm.ytmcp_box_rv;
      case TreaRewardEnum.wheel: return TreaAdPosIdEnumDwidjwm.ytmcp_wheelpop_rv;
      case TreaRewardEnum.lucky: return TreaAdPosIdEnumDwidjwm.ytmcp_floppop_rv;
      case TreaRewardEnum.card: return TreaAdPosIdEnumDwidjwm.ytmcp_srcpop_rv;
    }
  }

  Map<String,dynamic> _getTbaParams(){
    Map<String,dynamic> params={};
    if(rewardEnum==TreaRewardEnum.card){
      params["source_from"]=playType;
    }else{
      params["source_from"]=rewardEnum.name;
    }
    return params;
  }

  _checkShowSingle(){
    if(!isBigReward()){
      return;
    }
    _timer=Timer(Duration(milliseconds: 2000), (){
      showSingle=true;
      update(["single_btn"]);
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}