import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_box_hep_whidowmd.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';

class TreaBoxDialogDnwidiwC extends TreaFaC with GetSingleTickerProviderStateMixin{
  var boxNum=0,itemHeight=50.h,isSpinning = false;
  final List<FixedExtentScrollController> controllers = List.generate(3, (_) => FixedExtentScrollController());
  List<List<String>> iconsList=[["dmeimd","dmeodmoe","dmeimd"],["mdiwemodwm","dmeodmoe","dmeodmoe"],["dnwijdim","dmeodmoe","mdiwemodwm"]];

  late AnimationController _controller;
  late Animation<double> tiltAnimation;

  @override
  void onInit() {
    super.onInit();
    _initAnimator();
  }

  @override
  void onReady() {
    super.onReady();
    _queryBoxNum();
    for (final c in controllers) {
      c.jumpToItem(1);
    }
  }

  clickSpin()async{
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.treasure_c);
    if(boxNum<=0){
      showToast("Attempts Exhausted. Please Try Again Tomorrow.");
      return;
    }
    if (isSpinning){
      return;
    }
    isSpinning = true;

    _controller.forward();
    Future.delayed(const Duration(milliseconds: 500),(){
      _controller.reverse();
    });

    Random random = Random();
    for (int i = 0; i < controllers.length; i++) {
      final controller = controllers[i];
      final extraRounds = random.nextInt(10) + 10;
      final targetIndex = iconsList[i].length * extraRounds + 1;

      // 每列停下时增加一点延迟，形成顺序效果
      Future.delayed(Duration(milliseconds: i * 400), () async {
        await controller.animateToItem(
          targetIndex,
          duration: const Duration(milliseconds: 2500),
          curve: Curves.easeOutCubic,
        );

        if (i == controllers.length - 1) {
          isSpinning = false;
          _showRewardDialog();
        }
      });
    }
  }

  _showRewardDialog(){
    TreaBoxHepWhidowmd.instance.updateBoxNum(-1);
    TreaRouDwjidw.showDdjwidjow(
      child: TreaRewardDialogJwidjow(
        rewardEnum: TreaRewardEnum.box,
        reward: TreaValueHepJomeoc.instance.getBoxReward(),
        dismissCallback: (){
          TreaUserInfoHepDwidhiw.instance.checkShowFirstCashDialog();
        },
      ),
    );
  }

  clickClose(Function() dismissCallback){
    if (isSpinning){
      return;
    }
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call();
  }

  _queryBoxNum()async{
    boxNum = await TreaBoxHepWhidowmd.instance.queryTodayBoxNum();
    update(["btn"]);
  }

  _initAnimator(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // 从0旋转到-45度
    tiltAnimation = Tween<double>(begin: 0, end: -pi / 4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateBoxNum:
        _queryBoxNum();
        break;
    }
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}