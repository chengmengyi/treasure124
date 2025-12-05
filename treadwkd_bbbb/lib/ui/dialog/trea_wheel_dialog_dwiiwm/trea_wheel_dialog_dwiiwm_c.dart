import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_wheel_dialog_iejiw/trea_no_wheel_dialog_iejiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';

class TreaWheelDialogDwiiwmC extends TreaFaC with GetSingleTickerProviderStateMixin{
  var wheelReward=0.0,canClick=true,fromHome=false;
  List<double> wheelList=[];
  late AnimationController _wheelAnimationController;
  Animation<double>? wheelAnimation;
  late AnimationStatusListener _statusListener;

  TreaWheelDialogDwiiwmC(this.fromHome);

  @override
  void onInit() {
    super.onInit();
    _initAnimator();
  }

  @override
  void onReady() {
    super.onReady();
    clickSpin();
  }

  clickSpin(){
    if(!canClick){
      return;
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.wheel_page_c);
    if(bWheelNum.getData()<=0){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaNoWheelDialogIejiw(
          dismissCallback: (bool go){
            TreaRouDwjidw.backdwhudie();
            if(fromHome){
              TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.toPlayPage);
            }
          },
        ),
      );
      return;
    }
    canClick=false;
    _wheelAnimationController..reset()..forward();
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }

  _initAnimator(){
    _wheelAnimationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));
    _statusListener=(status){
      if(status==AnimationStatus.completed){
        _spinEnd();
      }
    };
    _wheelAnimationController.addStatusListener(_statusListener);
    _initWheelRewardList();
  }

  _spinEnd()async{
    await Future.delayed(Duration(milliseconds: 1000));
    TreaRouDwjidw.showDdjwidjow(
      child: TreaRewardDialogJwidjow(
        reward: wheelReward,
        rewardEnum: TreaRewardEnum.wheel,
        dismissCallback: (){
          TreaCashHepCneimdi.instance.updateCashTask(TreaTaskType.wheel);
          _initWheelRewardList();
          update(["wheel"]);
          TreaUserInfoHepDwidhiw.instance.checkShowFirstCashDialog();
        },
      ),
    );
    canClick=true;
    TreaUserInfoHepDwidhiw.instance.updateWheelNum(-1);
  }

  _initWheelRewardList(){
    wheelList.clear();
    wheelReward=TreaValueHepJomeoc.instance.getWheelReward();
    wheelList.add(wheelReward);
    wheelList.add(1000.0);
    while(wheelList.length<8){
      wheelList.add(_randomReward20(wheelReward));
    }
    wheelList.shuffle();

    var indexWhere = wheelList.indexWhere((value)=>value==wheelReward);
    if(indexWhere<0){
      canClick=true;
      return;
    }
    var angle = 720-indexWhere*45;
    wheelAnimation=Tween<double>(begin: 0,end: (720+angle)*(pi/180)).animate(_wheelAnimationController);
  }

  double _randomReward20(double value) {
    if (value == 0) return value;

    final random = Random();
    final factor = (random.nextDouble() * 0.4) - 0.2;
    final result = value * (1 + factor);
    final fixed = double.parse(result.toStringAsFixed(2));
    return fixed <= 0 ? value : fixed;
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateWheelNum:
        update(["wheel_num"]);
        break;
    }
  }

  @override
  void onClose() {
    _wheelAnimationController.removeStatusListener(_statusListener);
    _wheelAnimationController.dispose();
    super.onClose();
  }
}