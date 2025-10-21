import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_amount_bean.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_input_account_dialog_dmwidow/trea_input_account_dialog_dmwidow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_no_money_widowm/trea_no_money_dialog_widowm.dart';

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

  clickCashBtn(TreaAmountBean bean){
    TreaRouDwjidw.showDdjwidjow(
      child: TreaInputAccountDialogDmwidow(cashType: cashType, money: bean.money,),
    );
    // TreaRouDwjidw.showDdjwidjow(
    //   child: TreaNoMoneyDialogWidowm(),
    // );
  }

  clickOpenMoneySwitch(bool data){
    bOpenEyeSwitch.saveData(!data);
    update(["money"]);
  }

  changeCashType(String value){
    cashType=value;
    bSelectedCashType.saveData(cashType);
    update(["cash_type"]);
    _queryAmountList();
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

  String getAmountItemBg(){
    switch(cashType){
      case TreaCashType.paypal: return "miwmowm";
      case TreaCashType.cashapp: return "diwowjo";
      case TreaCashType.pagbank: return "mdowmowmo";
      case TreaCashType.pix: return "jodwdowm";
      default: return "hifwfiwj";
    }
  }

  String getCashBtnColor(){
    switch(cashType){
      case TreaCashType.paypal: return "#3256CD";
      case TreaCashType.cashapp: return "#71BA54";
      case TreaCashType.pagbank: return "#54B8BA";
      case TreaCashType.pix: return "#32B5BC";
      default: return "#32B5BC";
    }
  }

  String getAmountTaskBg(){
    switch(cashType){
      case TreaCashType.paypal: return "msiwmo";
      case TreaCashType.cashapp: return "hwhinisio";
      case TreaCashType.pagbank: return "msiwmiom";
      case TreaCashType.pix: return "dwuiwm";
      default: return "msiwmo";
    }
  }

  String getCashItemTopRightColor(){
    switch(cashType){
      case TreaCashType.paypal: return "#3256CD";
      case TreaCashType.cashapp: return "#71BA54";
      case TreaCashType.pagbank: return "#7BBDC6";
      case TreaCashType.pix: return "#54B8BA";
      default: return "#3256CD";
    }
  }

  String getTaskStr(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    var withdrawTask = TreaValueHepJomeoc.instance.getWithdrawTaskById(cashTaskInfo?.taskId);
    if(null==withdrawTask){
      return "";
    }
    switch(withdrawTask.type){
      case TreaTaskType.card: return "Scratch  ${cashTaskInfo?.currentProgress??0}/${cashTaskInfo?.totalProgress??0} Card";
      case TreaTaskType.wheel: return "Play  ${cashTaskInfo?.currentProgress??0}/${cashTaskInfo?.totalProgress??0} Spins";
      case TreaTaskType.lucky: return "Play  ${cashTaskInfo?.currentProgress??0}/${cashTaskInfo?.totalProgress??0} luck cards";
      case TreaTaskType.ad: return "Watch  ${cashTaskInfo?.currentProgress??0}/${cashTaskInfo?.totalProgress??0} Ad Video";
      default: return "";
    }
  }

  double getTaskProgress(TreaCashTaskInfoBeanWiodow? cashTaskInfo){
    var currentProgress = cashTaskInfo?.currentProgress??0;
    var totalProgress = cashTaskInfo?.totalProgress??0;
    if(totalProgress==0){
      return 0;
    }
    var d = currentProgress/totalProgress;
    if(d>1){
      return 1.0;
    }else if(d<0){
      return 0.0;
    }else{
      return d;
    }
  }

  _queryAmountList()async{
    amountList.clear();
    for (var value in TreaValueHepJomeoc.instance.getCashList()) {
      var treaCashTaskInfoBeanWiodow = await TreaCashHepCneimdi.instance.queryCashTaskInfo(cashType, value);
      amountList.add(TreaAmountBean(money: value,cashTaskInfoBeanWiodow: treaCashTaskInfoBeanWiodow));
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
      case TreaEventCodeDhwdhwi.updateCashAmountList:
        _queryAmountList();
        break;
    }
  }
}