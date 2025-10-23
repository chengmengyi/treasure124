import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaNoWheelDialogIejiwC extends TreaFaC{

  clickGo(Function(bool go) dismissCallback){
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call(true);
  }

  clickClose(Function(bool go) dismissCallback){
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call(false);
  }
}