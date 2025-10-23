import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/bean/trea_play_type_info_fhwiedhi.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';

class TreaUnlockDialogDoowdwjuC extends TreaFaC{

  clickGo(TreaPlayTypeInfoFhwiedhi bean){
    TreaAdHepNwidiow.instance.showAdndiwjdow(
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