import 'dart:math';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaKittenDwidwoC extends TreaFaC{
  late TreaPlayHepDnwidow playHepDnwidow;

  @override
  void onInit() {
    super.onInit();
    playHepDnwidow=TreaPlayHepDnwidow(
      playType: TreaCardType.kitten,
      updatePlayList: (){
        update(["list"]);
      },
      resetPlayCallback: (){
        _initList();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    _initList();
  }

  _initList(){
    List<TreaRewardItemBeanDwod> list=[];
    var kittenNum = TreaValueHepJomeoc.instance.getKittenNum();

    var kittenReward = TreaValueHepJomeoc.instance.getKittenReward();
    for(var index=0;index<kittenNum;index++){
      list.add(TreaRewardItemBeanDwod(reward: kittenReward, content: "cmienfi", win: true));
    }
    if(TreaValueHepJomeoc.instance.getKey()){
      list.add(TreaRewardItemBeanDwod(reward: 0.0, content: "icon_key", win: false,isKey: true));
    }
    while(list.length<12){
      list.add(TreaRewardItemBeanDwod(reward: kittenReward, content: Random().nextBool()?"mdiwmdoiw":"mciemi", win: false));
    }
    list.shuffle();
    playHepDnwidow.setRewardList(list);
    update(["list"]);
  }
}