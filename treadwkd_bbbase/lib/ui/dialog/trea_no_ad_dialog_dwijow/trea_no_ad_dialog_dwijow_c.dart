import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaNoAdDialogDwijowC extends TreaFaC{

  clickTryAgain(Function() tryAgainCallback){
    TreaRouDwjidw.backdwhudie();
    tryAgainCallback.call();
  }

  clickClose(Function() closeCallback){
    TreaRouDwjidw.backdwhudie();
    closeCallback.call();
  }
}