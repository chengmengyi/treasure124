import 'dart:async';

import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';

class TreaLevelUpDialogDwidjiwC extends TreaFaC{
  double reward=0.0;
  Function() dismissCallback;

  var showSingle=false;
  Timer? _timer;
  TreaLevelUpDialogDwidjiwC({
    required this.dismissCallback,
  });

  @override
  void onInit() {
    super.onInit();
    reward=TreaValueHepJomeoc.instance.getUpLevelReward().toDouble();
  }

  @override
  void onReady() {
    super.onReady();
    _checkShowSingle();
  }

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