import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaCompletedTaskDialogNwidowmC extends TreaFaC{

  @override
  void onInit() {
    super.onInit();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cash_task_complete);
  }

  click(Function() dismissCallback){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.request_congra_c);
    TreaRouDwjidw.backdwhudie();
    dismissCallback.call();
  }
}