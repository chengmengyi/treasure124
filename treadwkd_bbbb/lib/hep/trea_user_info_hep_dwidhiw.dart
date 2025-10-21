import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaUserInfoHepDwidhiw{
  static final TreaUserInfoHepDwidhiw _dwidhiw=TreaUserInfoHepDwidhiw();
  static TreaUserInfoHepDwidhiw get instance => _dwidhiw;

  updateMyMoney(double addNum){
    bMyMoney.saveData(addDecimal(bMyMoney.getData(), addNum));
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateMoneyNum);
    if(addNum>0&&bMyMoney.getData()>=TreaValueHepJomeoc.instance.getCashList().first){
      TreaCashHepCneimdi.instance.showFirstHasMoneyDialog();
    }
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