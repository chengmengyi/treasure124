import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
class TreaNoBoxNumDialogDoowdwjuC extends TreaFaC{

  clickGo(bool fromHome){
    TreaRouDwjidw.backdwhudie();
    if(fromHome){
      TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.toPlayPage);
    }
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }
}