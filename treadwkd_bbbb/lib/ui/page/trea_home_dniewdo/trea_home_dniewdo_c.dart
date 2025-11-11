import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_fk_dwidjow/trea_fk_hep_dwidowmd.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbase/hep/trea_notification_hep_dwjijdow.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';
import 'package:treadwkd_bbbase/treadwkd_bbbase.dart';
import 'package:treadwkd_bbbase/ui/dialog/trea_ad_limit_dialog_dwijow/trea_ad_limit_dialog_dwijow.dart';
import 'package:treadwkd_bbbase/ui/dialog/trea_no_ad_dialog_dwijow/trea_no_ad_dialog_dwijow.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/SlotMachinePage.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_step_omsmwo.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_view/trea_old_user_guide_view.dart';
import 'package:treadwkd_bbbb/hep/trea_hep_dnwidi.dart';
import 'package:treadwkd_bbbb/hep/trea_level_hep_dwifnowe.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_apply_animator_dialog_djwijow/trea_apply_animator_dialog_djwijow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_box_dialog_dnwidiw/trea_box_dialog_dnwidiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_cash_success_dialog_dwiiw/trea_cash_success_dialog_dwiiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_cash_task_dialog_dwidijw/trea_cash_task_dialog_dwidijw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_completed_task_dialog_nwidowm/trea_completed_task_dialog_nwidowm.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_donot_worry_dialog_cwidjoiw/trea_donot_worry_dialog_cwidjoiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_first_has_money_dialog_mwdowm/trea_first_has_money_dialog_mwdowm.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_give_money_animator_dialog_dmwodmow/trea_give_money_animator_dialog_dmwodmow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_level_up_dialog_dwidjiw/trea_level_up_dialog_dwidjiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_lucky_card_dialog_dwodo/trea_lucky_card_dialog_dwodo.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_chance_dialog_cnidniw/trea_no_chance_dialog_cnidniw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_network_dialog_dwijow/trea_no_network_dialog_dwijow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_wheel_dialog_iejiw/trea_no_wheel_dialog_iejiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_open_notification_dialog_dniwdow/trea_open_notification_dialog_dniwdow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_rank_dialog_dwiehiw/trea_rank_dialog_dwiehiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_set_dialog_djojow/trea_set_dialog_djojow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_unlock_dialog_doowdwju/trea_unlock_dialog_doowdwju.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_wheel_dialog_dwiiwm/trea_wheel_dialog_dwiiwm.dart';

class TreaHomeDniewdoC extends TreaFaC{
  Timer? _addPlayNumTimer;
  List<TreaPlayTypeInfoFhwiedhi> playTypeList=[];
  GlobalKey lucky77GlobalKey=GlobalKey();

  GlobalKey boxGlobalKey=GlobalKey();

  @override
  void onInit() {
    super.onInit();
    _startAddPlayNum();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.home_page);
    TreaFkHepDwidowmd.instance.initFk();
    TreadwkdBbbase.instance.treaOpen();
    TreaVoiceHepDwidiwn.instance.playBgmdwmodwo();
    TreaAdHepNwidiow.instance.watchAdCashTaskCallback=(){
      TreaCashHepCneimdi.instance.updateCashTask(TreaTaskType.ad);
    };
  }

  @override
  void onReady() {
    super.onReady();
    _initPlayTypeList(true);
  }

  clickItem(TreaPlayTypeInfoFhwiedhi bean){
    if(bean.unlock!=1){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaUnlockDialogDoowdwju(bean: bean),
      );
      return;
    }
    if((bean.currentPro??0)<=0){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaNoChanceDialogCnidniw(
          playType: bean.playType??"",
          clickCloseCallback: (){

          },
        ),
      );
      return;
    }
    var routerName = TreaHepDnwidi.getRouterNameByType(bean.playType??"");
    if(routerName.isEmpty){
      return;
    }
    TreaRouDwjidw.toJdeidedelde(routerName: routerName);
  }

  clickCash(){
    TreaRouDwjidw.toJdeidedelde(routerName: TreaBbbbRoulistJfoejfo.cash);
  }
  
  clickMoreFun()async{
    var gaid =await FlutterTbaInfo.instance.getGaid();
    toWebPage(title: "More Game", url: TreaLocalDjwidj.moreGame+gaid,isMoreGame: true,);
  }

  _initPlayTypeList(bool showNewUserGuide)async{
    playTypeList.clear();
    var list = await TreaPlayTypeHepFjwidjo.instance.getPlayTypeList();
    playTypeList.addAll(list);
    update(["play_type_list"]);
    if(showNewUserGuide){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        TreaGuideHepDwidmow.instance.checkShowNewUserGuide(context,lucky77GlobalKey,boxGlobalKey);
      });
    }
  }

  String getPlayTypeImages(TreaPlayTypeInfoFhwiedhi bean){
    switch(bean.playType){
      case TreaCardType.lucky77: return "home_77";
      case TreaCardType.wealth: return "home_wealth";
      case TreaCardType.kitten: return "home_kitten";
      case TreaCardType.magic: return "home_magic";
      case TreaCardType.sweet: return "home_sweet";
      case TreaCardType.number: return "home_number";
      default: return "home_77";
    }
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateHomeList:
        _initPlayTypeList(false);
        break;
      case TreaEventCodeDhwdhwi.toPlayPage:
        _toPlayPage();
        break;
    }
  }

  _toPlayPage(){
    var indexWhere = playTypeList.indexWhere((value)=>value.unlock==1&&(value.currentPro??0)>0);
    if(indexWhere>=0){
      clickItem(playTypeList[indexWhere]);
    }
  }

  _startAddPlayNum(){
    _addPlayNumTimer=Timer.periodic(Duration(seconds: 180), (t){
      TreaPlayTypeHepFjwidjo.instance.addAllPlayCardNum();
    });
  }

  test()async{
    if(!kDebugMode){
      return;
    }
    // TreaRouDwjidw.showDdjwidjow(child: TreaBoxDialogDnwidiw());
    // Navigator.push(context, MaterialPageRoute(builder: (_)=>SlotLeverAnimation()));

    // TreaPlayTypeHepFjwidjo.instance.updatePlayNumByType(TreaCardType.lucky77, -1);

    // TreaUserInfoHepDwidhiw.instance.updateMyMoney(200);
    // TreaRouDwjidw.showDdjwidjow(child: TreaNoWheelDialogIejiw());
    // TreaCashHepCneimdi.instance.updateCashTask(TreaTaskType.lucky);

    // _checkShowBoxFinger();

    // TreaFkHepDwidowmd.instance.initFk();

    TreaRouDwjidw.showDdjwidjow(child: TreaLuckyCardDialogDwodo(dismissDialogCallback: (b){},));


    // print("kkk===${AdNumHep.instance.notLoad()}");
    // TreaFkHepDwidowmd.instance.test();

  }

  @override
  void onClose() {
    _addPlayNumTimer?.cancel();
    _addPlayNumTimer=null;
    TreaAdHepNwidiow.instance.watchAdCashTaskCallback=null;
    super.onClose();
  }
}