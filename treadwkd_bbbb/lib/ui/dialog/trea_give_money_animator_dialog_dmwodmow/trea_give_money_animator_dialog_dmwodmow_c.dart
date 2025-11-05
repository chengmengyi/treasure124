import 'dart:async';

import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';

class TreaGiveMoneyAnimatorDialogDmwodmowC extends TreaFaC{
  var progressIndex=0,showSuccess=true;
  Timer? _timer;
  late Function() dismissCallback;

  TreaGiveMoneyAnimatorDialogDmwodmowC(this.dismissCallback);

  @override
  void onInit() {
    super.onInit();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.payment_failed_c);
  }

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
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call();
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