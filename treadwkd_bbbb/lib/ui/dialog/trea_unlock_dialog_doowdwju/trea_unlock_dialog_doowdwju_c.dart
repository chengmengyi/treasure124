import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaUnlockDialogDoowdwjuC extends TreaFaC{

  clickGo(TreaPlayTypeInfoFhwiedhi bean){
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      adType: AdType.reward,
      adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_unlock_rv,
      showAd: TreaValueHepJomeoc.instance.showAd(AdType.reward),
      closeAd: (give)async{
        if(give){
          await TreaPlayTypeHepFjwidjo.instance.unlockCardByPlayType(bean.playType);
          TreaRouDwjidw.backdwhudie();
        }
      },
    );
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }
}