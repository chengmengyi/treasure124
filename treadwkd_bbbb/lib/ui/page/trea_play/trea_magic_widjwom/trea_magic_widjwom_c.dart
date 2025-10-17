import 'dart:math';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_reward_item_bean_dwod.dart';
import 'package:treadwkd_bbbb/hep/trea_play_hep_dnwidow.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaMagicWidjwomC extends TreaFaC{
  late TreaPlayHepDnwidow playHepDnwidow;
  List<double> rewardList=[];
  final List<String> _bgList=["magic_hongtao","magic_heitao","magic_meihua","magic_fangkuai"];

  @override
  void onInit() {
    super.onInit();
    playHepDnwidow=TreaPlayHepDnwidow(
      playType: TreaCardType.magic,
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
    var pairs = generatePairs(TreaValueHepJomeoc.instance.getMagicWinNum());
    var isKey = TreaValueHepJomeoc.instance.getKey();
    for (var value in pairs) {
      var first = value.first;
      var last = value.last;
      var indexWhere = list.indexWhere((value)=>value.isKey);
      var magicReward = TreaValueHepJomeoc.instance.getMagicReward();
      if(first<last&&indexWhere<0&&isKey){
        list.add(TreaRewardItemBeanDwod(reward: 0.0, content: "icon_key", win: false,isKey: true));
        list.add(TreaRewardItemBeanDwod(reward: magicReward, content: _getCardNum(last), win: false,bg: _bgList.random(),));
      }else{
        list.add(TreaRewardItemBeanDwod(reward: magicReward, content: _getCardNum(first), win: first>last,bg: _bgList.random(),));
        list.add(TreaRewardItemBeanDwod(reward: magicReward, content: _getCardNum(last), win: false,bg: _bgList.random(),));
      }
      rewardList.add(magicReward);
    }

    playHepDnwidow.setRewardList(list);
    update(["list"]);
  }

  List<List<int>> generatePairs(int level) {
    final random = Random();
    final result = <List<int>>[];

    // 计算需要多少组 a > b
    int greaterCount = level.clamp(0, 4);
    int lessCount = 4 - greaterCount;

    // 先生成小于的组
    for (int i = 0; i < lessCount; i++) {
      int a, b;
      do {
        a = random.nextInt(13) + 1;
        b = random.nextInt(13) + 1;
      } while (a >= b); // 确保 a < b
      result.add([a, b]);
    }

    // 再生成大于的组
    for (int i = 0; i < greaterCount; i++) {
      int a, b;
      do {
        a = random.nextInt(13) + 1;
        b = random.nextInt(13) + 1;
      } while (a <= b); // 确保 a > b
      result.add([a, b]);
    }

    // 打乱顺序，避免规律性
    result.shuffle(random);

    return result;
  }

  String _getCardNum(int cardNum){
    switch(cardNum){
      case 11: return "J";
      case 12: return "Q";
      case 13: return "K";
      default: return "$cardNum";
    }
  }
}