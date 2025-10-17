import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_play_type_hep_fjwidjo.dart';

class TreaNoChanceDialogCnidniwC extends TreaFaC{
  clickClose(Function() clickCloseCallback){
    TreaRouDwjidw.backdwhudie();
    clickCloseCallback.call();
  }

  clickGet(String playType){
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      closeAd: (give)async{
        if(give){
          await TreaPlayTypeHepFjwidjo.instance.updatePlayNumByType(playType, 5);
        }
        TreaRouDwjidw.backdwhudie();
      },
    );
  }
}