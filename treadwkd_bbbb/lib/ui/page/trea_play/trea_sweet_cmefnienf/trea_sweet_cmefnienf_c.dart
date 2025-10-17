import 'dart:math';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaSweetCmefnienfC extends TreaFaC{
  late TreaPlayHepDnwidow playHepDnwidow;
  final List<String> _iconList=["sweet1","sweet2","sweet3","sweet4","sweet5","sweet6","sweet7","sweet8","sweet9","sweet10",];
  List<double> rewardList=[];

  @override
  void onInit() {
    super.onInit();
    playHepDnwidow=TreaPlayHepDnwidow(
      playType: TreaCardType.sweet,
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
    rewardList.clear();
    var iconGroups = generateIconGroups(TreaValueHepJomeoc.instance.getSweetWinNum());
    var isKey = TreaValueHepJomeoc.instance.getKey();
    for (var value in iconGroups) {
      var win = value.every((icon) => icon == value.first);
      var indexWhere = list.indexWhere((value)=>value.isKey);
      var sweetReward = TreaValueHepJomeoc.instance.getSweetReward();
      if(!win&&indexWhere<0&&isKey){
        list.add(TreaRewardItemBeanDwod(reward: 0.0, content: "icon_key", win: false,isKey: true));
        for(var index=0;index<value.length-1;index++){
          list.add(TreaRewardItemBeanDwod(reward: sweetReward, content: value[index], win: win));
        }
      }else{
        for (var value1 in value) {
          list.add(TreaRewardItemBeanDwod(reward: sweetReward, content: value1, win: win));
        }
      }
      rewardList.add(sweetReward);
    }
    playHepDnwidow.setRewardList(list);
    update(["list"]);
  }

  List<List<String>> generateIconGroups(int level) {
    final random = Random();
    final result = <List<String>>[];

    int threeSameCount = level.clamp(0, 4);
    int twoSameCount = 4 - threeSameCount;

    // 先生成 3 个一样的组
    for (int i = 0; i < threeSameCount; i++) {
      String icon = _iconList[random.nextInt(_iconList.length)];
      result.add([icon, icon, icon]);
    }

    // 再生成 “最多两个一样” 的组
    for (int i = 0; i < twoSameCount; i++) {
      String icon1 = _iconList[random.nextInt(_iconList.length)];
      String icon2;
      do {
        icon2 = _iconList[random.nextInt(_iconList.length)];
      } while (icon1 == icon2);

      // 随机是否要出现两次 icon1
      bool hasPair = random.nextBool();
      List<String> group;
      if (hasPair) {
        group = [icon1, icon1, icon2];
      } else {
        String icon3;
        do {
          icon3 = _iconList[random.nextInt(_iconList.length)];
        } while (icon3 == icon1 || icon3 == icon2);
        group = [icon1, icon2, icon3];
      }

      // 打乱组内顺序
      group.shuffle(random);
      result.add(group);
    }

    // 打乱所有组顺序
    result.shuffle(random);
    return result;
  }
}