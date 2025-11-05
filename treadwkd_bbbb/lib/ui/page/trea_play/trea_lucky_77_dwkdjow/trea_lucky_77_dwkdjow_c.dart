import 'dart:math';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_guide/trea_guide_hep_dwidmow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaLucky77DwkdjowC extends TreaFaC{
  late TreaPlayHepDnwidow playHepDnwidow;

  @override
  void onInit() {
    super.onInit();
    playHepDnwidow=TreaPlayHepDnwidow(
      playType: TreaCardType.lucky77,
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
    _showGuide2View();
  }

  _initList(){
    List<TreaRewardItemBeanDwod> list=[];
    while(list.length<15){
      var get7 = TreaValueHepJomeoc.instance.get7();
      var get7reward = TreaValueHepJomeoc.instance.get7Reward();
      if(get7){
        list.add(TreaRewardItemBeanDwod(reward: get7reward, content: "djiwdjow", win: true,));
      }else{
        list.add(TreaRewardItemBeanDwod(reward: get7reward, content: "${Random().nextInt(100)}", win: false,isText: true));
      }
    }
    var key = TreaValueHepJomeoc.instance.getKey();
    if(key){
      var indexWhere = list.indexWhere((value)=>!value.win);
      if(indexWhere>=0){
        list.removeAt(indexWhere);
        list.add(TreaRewardItemBeanDwod(reward: 0.0, content: "icon_key", win: false,isKey: true));
      }
    }
    list.shuffle();
    playHepDnwidow.setRewardList(list);
    update(["list"]);
  }

  _showGuide2View(){
    if(TreaGuideHepDwidmow.instance.checkShowAutoGuaGuide()){
      TreaGuideHepDwidmow.instance.showStep2GuideView(context, playHepDnwidow.scratcherKey);
    }
  }
}