import 'dart:math';
import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';
import 'package:treadwkd_bbbase/ui/scratcher/scratcher.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/hep/trea_level_hep_dwifnowe.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_level_up_dialog_dwidjiw/trea_level_up_dialog_dwidjiw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_lucky_card_dialog_dwodo/trea_lucky_card_dialog_dwodo.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_chance_dialog_cnidniw/trea_no_chance_dialog_cnidniw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_reward_dialog_cwidmdw/trea_no_reward_dialog_cwidmdw.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';

class TreaPlayHepDnwidow{
  var canClick=true,playType="";
  var scratcherKey = GlobalKey<ScratcherState>();
  GlobalKey keyGlobalKey=GlobalKey();
  GlobalKey wheelIconGlobalKey=GlobalKey();
  GlobalKey luckyCardIconGlobalKey=GlobalKey();
  List<TreaRewardItemBeanDwod> rewardList=[];
  Function() updatePlayList;
  Function() resetPlayCallback;

  final List<Offset> _pathPoints1 = const [
    Offset(55.7, 79.1),
    Offset(237.8, 77.5),
    Offset(62.6, 162.2),
    Offset(244.2, 196.9),
    Offset(39.7, 263.5),
    Offset(230.9, 293.4),
  ];

  final List<Offset> _pathPoints2 = const [
    Offset(28.5, 274.7),
    Offset(78.6, 106.3),
    Offset(104.2, 266.2),
    Offset(170.2, 133.5),
    Offset(212.8, 269.4),
    Offset(268.7, 134.5),
  ];

  TreaPlayHepDnwidow({
    required this.playType,
    required this.updatePlayList,
    required this.resetPlayCallback,
  }){
    TreaUserInfoHepDwidhiw.instance.checkShowFirstCashDialog();
  }

  setRewardList(List<TreaRewardItemBeanDwod> list){
    rewardList.clear();
    rewardList.addAll(list);
  }

  playStart(){
    TreaVoiceHepDwidiwn.instance.playSound(SoundType.gua);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showOrHideAutoGuaAnimator,str: "hide");
  }

  playEnd()async{
    canClick=false;
    scratcherKey.currentState?.reveal();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.scratch_count);
    TreaUserInfoHepDwidhiw.instance.addLuckyCardNum();
    TreaLevelHepDwifnowe.instance.addGuaKaNum();
    await Future.delayed(Duration(milliseconds: 1500));
    _startKeyAnimator();
    await TreaPlayTypeHepFjwidjo.instance.checkUnlockCardByLevel();
    await TreaPlayTypeHepFjwidjo.instance.updatePlayNumByType(playType, -1);
    _checkCashTask();
  }

  _checkCashTask()async{
    var completedTaskInfo = await TreaCashHepCneimdi.instance.updateCashTask(TreaTaskType.card);
    if(null==completedTaskInfo){
      _checkPlayReward();
    }else{
      TreaCashHepCneimdi.instance.showCompletedTaskDialog(
        taskInfo: completedTaskInfo,
        callback: (){
          _checkPlayReward();
        },
      );
    }
  }

  _checkPlayReward(){
    var allReward = _countAllReward();
    if(allReward>0){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaRewardDialogJwidjow(
          reward: allReward,
          playType: playType,
          rewardEnum: TreaRewardEnum.card,
          dismissCallback: (){
            TreaGuideHepDwidmow.instance.setNewUserGuideStep4();
            _checkLuckyStatus();
          },
        ),
      );
    }else{
      TreaVoiceHepDwidiwn.instance.playSound(SoundType.fail);
      TreaRouDwjidw.showDdjwidjow(
        child: TreaNoRewardDialogCwidmdw(
          dismissCallback: (){
            _checkLuckyStatus();
          },
        ),
      );
    }
  }

  _checkLuckyStatus()async{
    if(bLuckyCardNum.getData()>=3){
      var renderBox = luckyCardIconGlobalKey.currentContext?.findRenderObject() as RenderBox;
      var offset = renderBox.localToGlobal(Offset.zero);
      TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showLuckyCardAnimator,map: {"startOffset":offset});
      await Future.delayed(Duration(milliseconds: 1000));
      TreaRouDwjidw.showDdjwidjow(
        child: TreaLuckyCardDialogDwodo(
          dismissDialogCallback: (bool played)async{
            if(played){
              var completedTaskInfo = await TreaCashHepCneimdi.instance.updateCashTask(TreaTaskType.lucky);
              if(null==completedTaskInfo){
                _checkLevelStatus();
              }else{
                TreaCashHepCneimdi.instance.showCompletedTaskDialog(
                  taskInfo: completedTaskInfo,
                  callback: (){
                    _checkLevelStatus();
                  },
                );
              }
            }else{
              _checkLevelStatus();
            }
          },
        ),
      );
    }else{
      _checkLevelStatus();
    }
  }

  _checkLevelStatus(){
    var upLevel = TreaLevelHepDwifnowe.instance.checkUpLevel();
    if(upLevel){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaLevelUpDialogDwidjiw(
          dismissCallback: (){
            _checkToNextCard(upLevel);
          },
        ),
      );
    }else{
      _checkToNextCard(false);
    }
  }

  _checkToNextCard(bool upLevel){
    var handleLevel = TreaLevelHepDwifnowe.instance.handleLevel();
    if(handleLevel.level>=6&&playType==TreaCardType.number){
      _resetPlay();
      return;
    }
    if(upLevel){
      var routerName = _getNextLevelRouterName(handleLevel.level);
      if(routerName.isEmpty){
        _resetPlay();
      }else{
        TreaRouDwjidw.offFekjiodejod(routerName: routerName);
      }
    }else{
      _resetPlay();
    }
  }

  _resetPlay()async{
    canClick=true;
    scratcherKey.currentState?.reset();
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showOrHideAutoGuaAnimator,str: "show");
    resetPlayCallback.call();
    var playTypeInfo = await TreaPlayTypeHepFjwidjo.instance.queryCardInfoByType(playType);
    if((playTypeInfo?.currentPro??0)<=0){
      TreaRouDwjidw.showDdjwidjow(
        child: TreaNoChanceDialogCnidniw(
          playType: playType,
          clickCloseCallback: (){
            TreaRouDwjidw.backdwhudie();
          },
        ),
      );
    }else{
      TreaUserInfoHepDwidhiw.instance.checkShowFirstCashDialog();
    }
  }

  String _getNextLevelRouterName(int level){
    switch(level){
      case 1: return TreaBbbbRoulistJfoejfo.lucky77;
      case 2: return TreaBbbbRoulistJfoejfo.wealth;
      case 3: return TreaBbbbRoulistJfoejfo.kitten;
      case 4: return TreaBbbbRoulistJfoejfo.magic;
      case 5: return TreaBbbbRoulistJfoejfo.sweet;
      case 6: return TreaBbbbRoulistJfoejfo.number;
      default: return "";
    }
  }

  double _countAllReward(){
    var reward=0.0;
    switch(playType){
      case TreaCardType.lucky77:
      case TreaCardType.magic:
      case TreaCardType.number:
        reward = rewardList.where((item) => item.win).fold(0, (sum, item) => addDecimal(sum, item.reward));
        break;
      case TreaCardType.wealth:
        final seenContents = <String>{};
        for (final item in rewardList) {
          if (item.win && !seenContents.contains(item.content)) {
            seenContents.add(item.content);
            reward=addDecimal(reward, item.reward);
          }
        }
        break;
      case TreaCardType.kitten:
        var countWinTrue = rewardList.where((e) => e.win).length;
        if(countWinTrue>0){
          var indexWhere = rewardList.indexWhere((value)=>value.win);
          if(indexWhere>=0){
            reward=mulDecimal(rewardList[indexWhere].reward,TreaValueHepJomeoc.instance.getKittenMultiple(countWinTrue));
          }
        }
        break;
      case TreaCardType.sweet:
        double result = rewardList.where((item) => item.win).fold(0, (sum, item) => addDecimal(sum, item.reward));
        reward=divDecimal(result, 3);
        break;
    }
    return reward;
  }

  _startKeyAnimator()async{
    var indexWhere = rewardList.indexWhere((value)=>value.isKey);
    if(indexWhere<0){
      return;
    }
    var keyBox = keyGlobalKey.currentContext?.findRenderObject() as RenderBox;
    var keyOffset = keyBox.localToGlobal(Offset.zero);
    var wheelBox = wheelIconGlobalKey.currentContext?.findRenderObject() as RenderBox;
    var wheelOffset = wheelBox.localToGlobal(Offset.zero);
    rewardList[indexWhere].showKey=false;
    updatePlayList.call();
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showKeyAnimator,map: {"startOffset":keyOffset,"endOffset":wheelOffset});
    await Future.delayed(Duration(milliseconds: 1000));
    TreaUserInfoHepDwidhiw.instance.updateWheelNum(1);
  }

  autoPlay()async{
    if(!canClick){
      return;
    }
    canClick=false;
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showOrHideAutoGuaAnimator,str: "hide");
    var list = Random().nextBool()?_pathPoints1:_pathPoints2;
    const int stepsPerSegment = 30;
    const Duration delay = Duration(milliseconds: 5);

    for (int i = 0; i < list.length - 1; i++) {
      final start = list[i];
      final end = list[i + 1];
      final dx = (end.dx - start.dx) / stepsPerSegment;
      final dy = (end.dy - start.dy) / stepsPerSegment;

      for (int j = 0; j <= stepsPerSegment; j++) {
        final px = start.dx + dx * j;
        final py = start.dy + dy * j;
        scratcherKey.currentState?.addPoint(Offset(px, py));
        await Future.delayed(delay);
      }
    }
    await Future.delayed(const Duration(milliseconds: 400));
    scratcherKey.currentState?.reveal(duration: const Duration(milliseconds: 600));
  }

  clickClose(){
    if(!canClick){
      return;
    }
    TreaRouDwjidw.backdwhudie();
  }
}