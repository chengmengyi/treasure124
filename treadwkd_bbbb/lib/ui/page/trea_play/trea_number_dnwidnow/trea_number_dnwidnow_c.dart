import 'dart:math';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaNumberDnwidnowC extends TreaFaC{
  late TreaPlayHepDnwidow playHepDnwidow;
  List<int> winNumberList=[];

  @override
  void onInit() {
    super.onInit();
    playHepDnwidow=TreaPlayHepDnwidow(
      playType: TreaCardType.number,
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
    winNumberList.clear();
    winNumberList.addAll(generateUniqueRandomList(1,99,3));
    update(["win_number"]);
    var result = generateList(TreaValueHepJomeoc.instance.getNumberWinNum(),winNumberList);
    for (var value in result) {
      list.add(TreaRewardItemBeanDwod(reward: TreaValueHepJomeoc.instance.getNumberReward(), content: "$value", win: winNumberList.contains(value)));
    }

    if(TreaValueHepJomeoc.instance.getKey()){
      var indexWhere = list.indexWhere((value)=>!winNumberList.contains(value.content.toInt()));
      if(indexWhere>=0){
        list.removeAt(indexWhere);
        list.add(TreaRewardItemBeanDwod(reward: 0.0, content: "icon_key", win: false,isKey: true));
      }
    }
    list.shuffle();
    playHepDnwidow.setRewardList(list);
    update(["list"]);
  }

  /// 生成指定范围内 [min, max] 不重复随机整数列表
  List<int> generateUniqueRandomList(int min, int max, int count) {
    final rand = Random();
    final numbers = <int>{};
    while (numbers.length < count) {
      numbers.add(min + rand.nextInt(max - min + 1));
    }
    return numbers.toList();
  }

  /// 生成一个长度为16的list，
  /// overlapCount 表示与 list1 重复的数量（0~5）
  /// 0 ≤ overlapCount ≤ min(5, list1.length)
  List<int> generateList(int overlapCount, List<int> list1) {
    if (overlapCount < 0 || overlapCount > 5) {
      throw ArgumentError('overlapCount 必须在 0~5 之间');
    }

    final rand = Random();

    // ---- 1. 随机选出 overlapCount 个重叠的数字 ----
    final overlapNums = <int>[];
    if (overlapCount > 0) {
      final temp = list1.toList()..shuffle(rand);
      overlapNums.addAll(temp.take(overlapCount));
    }

    // ---- 2. 剩下的需要多少 ----
    int remainingCount = 16 - overlapNums.length;

    // ---- 3. 从 0~99 中生成其他随机数 ----
    final resultSet = <int>{...overlapNums};
    while (resultSet.length < 16) {
      int n = rand.nextInt(100); // 0~99
      // 如果这个数是 list1 中的数字，但不是我们选的 overlap，就跳过
      if (list1.contains(n) && !overlapNums.contains(n)) continue;
      resultSet.add(n);
    }

    // ---- 4. 打乱顺序 ----
    final result = resultSet.toList()..shuffle(rand);

    return result;
  }
}