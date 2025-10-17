import 'dart:async';

import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';

class TreaRewardDialogJwidjowC extends TreaFaC{
  double reward;
  Function() dismissCallback;

  var showSingle=false;
  Timer? _timer;
  TreaRewardDialogJwidjowC({
    required this.reward,
    required this.dismissCallback,
  });

  @override
  void onReady() {
    super.onReady();
    _checkShowSingle();
  }

  bool isBigReward()=>reward>=40;

  clickDouble(){
    TreaAdHepNwidiow.instance.showAdndiwjdow(
        closeAd: (give){
          TreaRouDwjidw.backdwhudie();
          if(give){
            TreaUserInfoHepDwidhiw.instance.updateMyMoney(doubleDecimal(reward));
          }
          dismissCallback.call();
        }
    );
  }

  clickSingle(){
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      closeAd: (give){
        TreaRouDwjidw.backdwhudie();
        if(give){
          TreaUserInfoHepDwidhiw.instance.updateMyMoney(reward);
        }
        dismissCallback.call();
      }
    );
  }

  _checkShowSingle(){
    if(!isBigReward()){
      return;
    }
    _timer=Timer(Duration(milliseconds: 2000), (){
      showSingle=true;
      update(["single_btn"]);
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}