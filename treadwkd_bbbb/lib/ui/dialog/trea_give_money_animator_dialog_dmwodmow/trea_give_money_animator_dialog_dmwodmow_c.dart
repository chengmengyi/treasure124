import 'dart:async';

import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';

class TreaGiveMoneyAnimatorDialogDmwodmowC extends TreaFaC{
  var progressIndex=0,showSuccess=true;
  Timer? _timer;

  @override
  void onReady() {
    super.onReady();
    _startTimer();
  }

  _startTimer()async{
    _timer=Timer.periodic(Duration(milliseconds: 500), (t){
      progressIndex++;
      update(["content"]);
      if(progressIndex>=4){
        progressIndex=0;
      }
    });
    await Future.delayed(Duration(milliseconds: 4000));
    _timer?.cancel();
    _timer=null;
    showSuccess=false;
    update(["content"]);
    await Future.delayed(Duration(milliseconds: 1000));
    //todo 下一步写 donot worry 弹窗
  }

  String getCashBg(String cashType){
    switch(cashType){
      case TreaCashType.paypal: return "dmiwmodwm";
      case TreaCashType.cashapp: return "hiwdniwmd";
      case TreaCashType.pagbank: return "wyindwm";
      case TreaCashType.pix: return "jsihduwhduwn";
      default: return "jsihduwhduwn";
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    _timer=null;
    super.onClose();
  }
}