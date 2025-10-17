import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';

class TreaUserInfoHepDwidhiw{
  static final TreaUserInfoHepDwidhiw _dwidhiw=TreaUserInfoHepDwidhiw();
  static TreaUserInfoHepDwidhiw get instance => _dwidhiw;

  updateMyMoney(double addNum){
    bMyMoney.saveData(addDecimal(bMyMoney.getData(), addNum));
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateMoneyNum);
  }

  addLuckyCardNum(){
    bLuckyCardNum.saveData(bLuckyCardNum.getData()+1);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateLuckyCardNum);
  }

  resetLuckyCardNum(){
    bLuckyCardNum.saveData(0);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateLuckyCardNum);
  }

  updateWheelNum(int addNum){
    bWheelNum.saveData(bWheelNum.getData()+addNum);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateWheelNum);
  }
}