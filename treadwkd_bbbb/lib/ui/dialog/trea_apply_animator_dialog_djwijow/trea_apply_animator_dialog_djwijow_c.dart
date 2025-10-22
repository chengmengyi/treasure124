import 'dart:async';

import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaApplyAnimatorDialogDjwijowC extends TreaFaC{
  var progressIndex=0,showSuccess=false;
  Timer? _timer;
  late Function() dismissCallback;

  TreaApplyAnimatorDialogDjwijowC(this.dismissCallback);

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
    showSuccess=true;
    update(["content"]);
    await Future.delayed(Duration(milliseconds: 1000));
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call();
  }

  @override
  void onClose() {
    _timer?.cancel();
    _timer=null;
    super.onClose();
  }
}