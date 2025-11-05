
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/bean/trea_rank_bean_djwoiejowj.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaRankDialogDwiehiwC extends TreaFaC{
  List<TreaRankBeanDjwoiejowj> rankList=[];
  ScrollController scrollController=ScrollController();

  late TreaCashTaskInfoBeanWiodow taskInfo;
  late Function(bool completed) dismissCallback;
  TreaRankDialogDwiehiwC(this.taskInfo,this.dismissCallback);

  @override
  void onInit() {
    super.onInit();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.queue_page);
  }

  @override
  void onReady() {
    super.onReady();
    _initRankList();
  }

  clickSkip(){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.queue_c);
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      adType: AdType.reward,
      adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_queue_rv,
      showAd: true,
      closeAd: (give){
        if(give){
          _changeRankList();
        }
      },
    );
  }

  _changeRankList()async{
    taskInfo=await TreaCashHepCneimdi.instance.updateRankProgress(taskInfo);
    _initRankList();
  }

  _initRankList()async{
    var totalProgress = taskInfo.totalProgress??0;
    if(totalProgress<=0){
      update(["list"]);
      return;
    }
    while(rankList.length<totalProgress-1){
      var bean = TreaRankBeanDjwoiejowj(
        account: "${randomTwoLetters()}****.com",
        amount: TreaValueHepJomeoc.instance.getCashList().random(),
        isMe: false,
      );
      rankList.add(bean);
    }
    var currentRank = taskInfo.currentProgress??0;
    var account = await TreaCashHepCneimdi.instance.queryCashAccount(taskInfo.cashType);
    if(account.isEmpty){
      account="${randomTwoLetters()}****.com";
    }
    if(currentRank==0){
      rankList.insert(0, TreaRankBeanDjwoiejowj(account: account, amount: taskInfo.cashMoney??0,isMe: true,));
    }else{
      rankList.insert(currentRank-1, TreaRankBeanDjwoiejowj(account: account, amount: taskInfo.cashMoney??0,isMe: true));
    }
    update(["list","rank_text"]);
    var indexWhere = rankList.indexWhere((value)=>value.isMe);
    if(indexWhere==0){
      TreaRouDwjidw.backdwhudie();
      dismissCallback.call(true);
    }else if(indexWhere>6){
      scrollController.animateTo(
        (24.h)*(indexWhere-4),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }else if(indexWhere<=6){
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  String randomTwoLetters() {
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final random = Random();
    return String.fromCharCodes(List.generate(2, (_) => letters.codeUnitAt(random.nextInt(letters.length)),));
  }

  String getUserId(int index){
    if(index<10){
      return "00$index";
    }else if(index<100){
      return "0$index";
    }else{
      return "$index";
    }
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call(false);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}