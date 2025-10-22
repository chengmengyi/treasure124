import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';
import 'package:treadwkd_bbbb/hep/trea_user_info_hep_dwidhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_reward_dialog_jwidjow/trea_reward_dialog_jwidjow.dart';

class TreaLuckyCardDialogDwodoC extends TreaFaC{
  var canClick=true;
  Function(bool played) dismissDialogCallback;
  TreaLuckyCardDialogDwodoC({
    required this.dismissDialogCallback,
});

  List<double> rewardList=[];
  @override
  void onInit() {
    super.onInit();
    rewardList.clear();
    while(rewardList.length<6){
      rewardList.add(TreaValueHepJomeoc.instance.getLuckyCardReward());
    }
  }

  clickCardItem(index)async{
    if(!canClick){
      return;
    }
    canClick=false;
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.flipLuckyCard,i: index);
    await Future.delayed(Duration(milliseconds: 1000));
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.flipOtherLuckyCard,i: index);
    await Future.delayed(Duration(milliseconds: 1000));
    TreaRouDwjidw.showDdjwidjow(
      child: TreaRewardDialogJwidjow(
        reward: rewardList[index],
        dismissCallback: (){
          TreaUserInfoHepDwidhiw.instance.resetLuckyCardNum();
          TreaRouDwjidw.backdwhudie();
          dismissDialogCallback.call(true);
        },
      ),
    );
  }

  clickClose(){
    if(!canClick){
      return;
    }
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      closeAd: (give){
        TreaUserInfoHepDwidhiw.instance.resetLuckyCardNum();
        TreaRouDwjidw.backdwhudie();
        dismissDialogCallback.call(false);
      },
    );
  }
}