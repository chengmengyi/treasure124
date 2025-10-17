import 'dart:math';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaWealthDmwidmC extends TreaFaC{
  final List<String> _resourceIconList=["wealth1","wealth2","wealth3","wealth4","wealth5","wealth6","wealth7","wealth8","wealth9","wealth10","wealth11",];
  late TreaPlayHepDnwidow playHepDnwidow;

  @override
  void onInit() {
    super.onInit();
    playHepDnwidow=TreaPlayHepDnwidow(
      playType: TreaCardType.wealth,
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
    var wealthWinNum = TreaValueHepJomeoc.instance.getWealthWinNum();
    var list = generateIconList(wealthWinNum);
    playHepDnwidow.setRewardList(list);
    update(["list"]);
  }

  List<TreaRewardItemBeanDwod> generateIconList(int winCount) {
    final random = Random();

    // 限制 winCount 最大为 4
    winCount = winCount.clamp(0, 4);

    // 随机选中中奖 icon（不重复）
    final List<String> winIcons = [];
    final available = List<String>.from(_resourceIconList);
    for (int i = 0; i < winCount; i++) {
      final pick = available.removeAt(random.nextInt(available.length));
      winIcons.add(pick);
    }

    // 记录每个icon的出现次数
    final Map<String, int> counts = {for (var e in _resourceIconList) e: 0};

    final List<TreaRewardItemBeanDwod> result = [];

    // 添加中奖icon（每个3次）
    for (final icon in winIcons) {
      var wealthReward = TreaValueHepJomeoc.instance.getWealthReward();
      result.add(TreaRewardItemBeanDwod(reward: wealthReward, content: icon, win: true));
      result.add(TreaRewardItemBeanDwod(reward: wealthReward, content: icon, win: true));
      result.add(TreaRewardItemBeanDwod(reward: wealthReward, content: icon, win: true));
      counts[icon] = 3;
    }

    if(TreaValueHepJomeoc.instance.getKey()){
      result.add(TreaRewardItemBeanDwod(reward: 0.0, content: "icon_key", win: false,isKey: true));
    }

    // 添加其他icon，每个1~2次
    for (final icon in _resourceIconList) {
      if (winIcons.contains(icon)) continue;
      final times = 1 + random.nextInt(2); // 1或2
      for (int i = 0; i < times; i++) {
        if (result.length >= 20) break;
        result.add(TreaRewardItemBeanDwod(reward: TreaValueHepJomeoc.instance.getWealthReward(), content: icon, win: false));
        counts[icon] = (counts[icon] ?? 0) + 1;
      }
    }

    // 如果长度还不到20，再从可添加的icon中补足
    while (result.length < 20) {
      final candidates = counts.entries
          .where((e) => e.value < 2) // 没超过2次的才可以补
          .map((e) => e.key)
          .toList();
      if (candidates.isEmpty) break;
      final icon = candidates[random.nextInt(candidates.length)];
      result.add(TreaRewardItemBeanDwod(reward: TreaValueHepJomeoc.instance.getWealthReward(), content: icon, win: false));
      counts[icon] = (counts[icon] ?? 0) + 1;
    }

    // 打乱顺序
    result.shuffle(random);

    return result.take(20).toList();
  }
}