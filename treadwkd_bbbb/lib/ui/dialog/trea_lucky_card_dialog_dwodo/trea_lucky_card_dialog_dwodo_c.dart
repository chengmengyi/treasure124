import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
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
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.flip_card_page);
  }

  clickCardItem(index)async{
    if(!canClick){
      return;
    }
    canClick=false;
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.card_c);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.flipLuckyCard,i: index);
    await Future.delayed(Duration(milliseconds: 1000));
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.flipOtherLuckyCard,i: index);
    await Future.delayed(Duration(milliseconds: 1000));
    canClick=true;
    TreaRouDwjidw.showDdjwidjow(
      child: TreaRewardDialogJwidjow(
        reward: rewardList[index],
        rewardEnum: TreaRewardEnum.lucky,
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
      adType: AdType.interstitial,
      adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_floppop_int,
      showAd: TreaValueHepJomeoc.instance.showAd(AdType.interstitial),
      closeAd: (give){
        TreaUserInfoHepDwidhiw.instance.resetLuckyCardNum();
        TreaRouDwjidw.backdwhudie();
        dismissDialogCallback.call(false);
      },
    );
  }
}