import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaNoMoneyWidowmC extends TreaFaC{

  @override
  void onInit() {
    super.onInit();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cash_not_pop);
  }

  clickClose(){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cash_not_pop_c);
    TreaRouDwjidw.toHomedwhidhiw(str: TreaBbbbRoulistJfoejfo.home);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.toPlayPage);
  }
}