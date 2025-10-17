import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbb/bean/trea_level_bean_jwijfo.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';

class TreaLevelHepDwifnowe{
  static final TreaLevelHepDwifnowe _dwifnowe=TreaLevelHepDwifnowe();
  static TreaLevelHepDwifnowe get instance => _dwifnowe;

  final List<int> _levelCosts = [5, 5, 5, 5, 5];
  final List<int> _upLevelCosts = [5, 10, 15, 20, 25];

  TreaLevelBeanJwijfo handleLevel() {
    int level = 1;
    int current = bGuaKaNum.getData();

    for (int total in _levelCosts) {
      if (current >= total) {
        current -= total;
        level++;
      } else {
        return TreaLevelBeanJwijfo(level, current, total);
      }
    }
    return TreaLevelBeanJwijfo(level, 0, 0);
  }

  int getMax()=>_levelCosts.last;

  addGuaKaNum(){
    bGuaKaNum.saveData(bGuaKaNum.getData()+1);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateGuaKaNum);
  }

  bool checkUpLevel()=>_upLevelCosts.contains(bGuaKaNum.getData());
}