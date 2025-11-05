import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaNoChanceDialogCnidniwC extends TreaFaC{
  clickClose(Function() clickCloseCallback){
    TreaRouDwjidw.backdwhudie();
    clickCloseCallback.call();
  }

  clickGet(String playType){
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      adType: AdType.reward,
      showAd: TreaValueHepJomeoc.instance.showAd(AdType.reward),
      adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_src_rv,
      closeAd: (give)async{
        if(give){
          await TreaPlayTypeHepFjwidjo.instance.updatePlayNumByType(playType, 5);
        }
        TreaRouDwjidw.backdwhudie();
      },
    );
  }
}