import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';

class TreaInputAccountDialogDmwidowC extends TreaFaC{
  TextEditingController textEditingController=TextEditingController();

  clickCash(String cashType, int money)async{
    var content = textEditingController.text.trim();
    if(cashType==TreaCashType.cashapp&&!_isTenDigitNumber(content)){
      showToast("The format you entered is incorrect.");
      return;
    }
    if(!_isEmail(content)){
      showToast("The format you entered is incorrect.");
      return;
    }
    await TreaCashHepCneimdi.instance.createCashTask(cashType, money);
    TreaUserInfoHepDwidhiw.instance.updateMyMoney((-money).toDouble());
    TreaRouDwjidw.backdwhudie();
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }

  bool _isEmail(String input) {
    final emailRegex = RegExp(
      r'^[\w\.-]+@[\w\.-]+\.\w+$',
    );
    return emailRegex.hasMatch(input);
  }

  bool _isTenDigitNumber(String input) {
    return RegExp(r'^\d{10}$').hasMatch(input);
  }

  String getInputTips(String cashType){
    switch(cashType){
      case TreaCashType.paypal: return "e.g.999999999@qq.com";
      case TreaCashType.cashapp: return "e.g.5551234567";
      case TreaCashType.pagbank: return "e.g.999999999@qq.com";
      default: return "input your account";
    }
  }

  List<Color> getBtnColors(String cashType){
    switch(cashType){
      case TreaCashType.paypal: return ["#192B67".toColordwdowfw(),"#3256CD".toColordwdowfw()];
      case TreaCashType.cashapp: return ["#206719".toColordwdowfw(),"#3FCD32".toColordwdowfw()];
      case TreaCashType.pagbank: return ["#196756".toColordwdowfw(),"#32CDAB".toColordwdowfw()];
      default: return ["#192B67".toColordwdowfw(),"#3256CD".toColordwdowfw()];
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}