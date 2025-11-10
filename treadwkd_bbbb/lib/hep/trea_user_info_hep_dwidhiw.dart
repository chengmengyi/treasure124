import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_fk_dwidjow/trea_fk_hep_dwidowmd.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaUserInfoHepDwidhiw{
  static final TreaUserInfoHepDwidhiw _dwidhiw=TreaUserInfoHepDwidhiw();
  static TreaUserInfoHepDwidhiw get instance => _dwidhiw;

  updateMyMoney(double addNum)async{
    bMyMoney.saveData(addDecimal(bMyMoney.getData(), addNum));
    if(addNum>0){
      bShowAdMoneyTag.saveData(addDecimal(bShowAdMoneyTag.getData(), addNum));
      _handleMoneyLevelDJOWJDOdow();
      _handleFkInfodwhidw();
    }
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.showMoneyAnimator);
    await Future.delayed(Duration(milliseconds: 1000));
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateMoneyNum);
  }

  _handleMoneyLevelDJOWJDOdow(){
    var moneyLevel = bLastUploadMoneyLevel.getData()+100;
    var data = bMyMoney.getData();
    if(data>=moneyLevel){
      var max = ((data-moneyLevel)~/100)+1;
      for(var index=0; index<max; index++){
        TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cash_money_detail,params: {"money":moneyLevel});
        bLastUploadMoneyLevel.saveData(moneyLevel);
        moneyLevel+=100;
      }
    }
  }

  _handleFkInfodwhidw(){
    var firstCashMoney = TreaValueHepJomeoc.instance.getCashList().first;
    var getRewardNum = treaGetRewardRevenueNumdwjdjwo.getData();
    var data = bMyMoney.getData();
    var adLess = TreaFkHepDwidowmd.instance.getAdLessdjwokdowo();
    if(data>=firstCashMoney&&getRewardNum<adLess){
      treaCashMoneyAdLessdwidow.saveData(true);
    }
    var adMore = TreaFkHepDwidowmd.instance.getAdMorewidjwo();
    if(data<firstCashMoney&&getRewardNum>=adMore){
      treaCashMoneyAdMoredwidjow.saveData(true);
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

  checkShowFirstCashDialog(){
    if(bMyMoney.getData()>=TreaValueHepJomeoc.instance.getCashList().first){
      TreaCashHepCneimdi.instance.showFirstHasMoneyDialog();
    }
  }
}