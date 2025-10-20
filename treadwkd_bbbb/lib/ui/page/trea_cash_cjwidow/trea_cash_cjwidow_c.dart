import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_amount_bean.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaCashCjwidowC extends TreaFaC{
  var cashType=bSelectedCashType.getData();
  List<TreaAmountBean> amountList=[];

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
    _queryAmountList();
  }

  clickOpenMoneySwitch(bool data){
    bOpenEyeSwitch.saveData(!data);
    update(["money"]);
  }

  String getTopBg(){
    switch(cashType){
      case TreaCashType.paypal: return "ndiwidw";
      case TreaCashType.cashapp: return "mdiwmidw";
      case TreaCashType.pagbank: return "ndiwmdiwm";
      case TreaCashType.pix: return "dhiwjdiwj";
      default: return "ndiwidw";
    }
  }

  String getTopCashTypeIcon(){
    switch(cashType){
      case TreaCashType.paypal: return "hifwfiwj";
      case TreaCashType.cashapp: return "niwndiwm";
      case TreaCashType.pagbank: return "wdmowmdoa";
      case TreaCashType.pix: return "iijioxmo";
      default: return "hifwfiwj";
    }
  }

  String getAmountItemBg(){
    switch(cashType){
      case TreaCashType.paypal: return "miwmowm";
      case TreaCashType.cashapp: return "diwowjo";
      case TreaCashType.pagbank: return "mdowmowmo";
      case TreaCashType.pix: return "jodwdowm";
      default: return "hifwfiwj";
    }
  }

  _queryAmountList(){
    amountList.clear();
    for (var value in TreaValueHepJomeoc.instance.getCashList()) {
      amountList.add(TreaAmountBean(money: value));
    }
    update(["amount"]);
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.updateMoneyNum:
        update(["money"]);
        break;
    }
  }
}