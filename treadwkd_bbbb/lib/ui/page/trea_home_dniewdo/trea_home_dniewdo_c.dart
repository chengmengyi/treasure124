import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/SlotMachinePage.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
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
import 'package:treadwkd_bbbb/ui/dialog/trea_rank_dialog_dwiehiw/trea_rank_dialog_dwiehiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';

class TreaHomeDniewdoC extends TreaFaC{
  Timer? _addPlayNumTimer;
  List<TreaPlayTypeInfoFhwiedhi> playTypeList=[];

  @override
  void onInit() {
    super.onInit();
    _startAddPlayNum();
  }

  @override
  void onReady() {
    super.onReady();
    _initPlayTypeList();
  }

  clickItem(TreaPlayTypeInfoFhwiedhi bean){
    var routerName = TreaHepDnwidi.getRouterNameByType(bean.playType??"");
    if(routerName.isEmpty){
      return;
    }
    TreaRouDwjidw.toJdeidedelde(routerName: routerName);
  }

  clickCash(){
    TreaRouDwjidw.toJdeidedelde(routerName: TreaBbbbRoulistJfoejfo.cash);
  }

  _initPlayTypeList()async{
    playTypeList.clear();
    var list = await TreaPlayTypeHepFjwidjo.instance.getPlayTypeList();
    playTypeList.addAll(list);
    update(["play_type_list"]);
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
        _initPlayTypeList();
        break;
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
    Navigator.push(context, MaterialPageRoute(builder: (_)=>WheelSlotMachine()));

    // TreaPlayTypeHepFjwidjo.instance.updatePlayNumByType(TreaCardType.lucky77, -1);

    // TreaUserInfoHepDwidhiw.instance.updateMyMoney(200);
    // TreaRouDwjidw.showDdjwidjow(child: TreaCashSuccessDialogDwiiw());
    // TreaCashHepCneimdi.instance.updateCashTask(TreaTaskType.lucky);
  }

  @override
  void onClose() {
    _addPlayNumTimer?.cancel();
    _addPlayNumTimer=null;
    super.onClose();
  }
}