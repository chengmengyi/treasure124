import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaSetDialogDjojowC extends TreaFaC{

  clickMusic(){
    TreaVoiceHepDwidiwn.instance.setMusichdiwhid();
    update(["music"]);
  }

  clickSound(){
    bPlaySound.saveData(!bPlaySound.getData());
    update(["sound"]);
  }

  clickPrivacy(){
    toWebPage(title: "Privacy", url: TreaLocalDjwidj.privacyUrl);
  }

  clickEmail(){

  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }
}