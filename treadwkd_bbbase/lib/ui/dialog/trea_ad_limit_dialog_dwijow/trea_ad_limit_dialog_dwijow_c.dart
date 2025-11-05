import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaAdLimitDialogDwijowC extends TreaFaC{

  clickClose(Function() dismissCallback){
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call();
  }
}