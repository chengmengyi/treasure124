import 'dart:async';
import 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
import 'package:flutter_android_ad_plugins/hep/ad_type.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_notification_hep_dwjijdow.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';

class TreaApplifeHepDwodmow{
  static final TreaApplifeHepDwodmow _applifeHepDwodmow=TreaApplifeHepDwodmow();
  static TreaApplifeHepDwodmow get instance => _applifeHepDwodmow;

  var _back=false,toOpenNotification=false;
  Timer? _timer;

  initAppLife(){
    FlutterAppLifecycle.instance.setCallObserver(
      AppStateObserver(
        call: (back){
          _callbackdwdwjidiw(back);
        },
      ),
    );
  }

  _callbackdwdwjidiw(bool back)async{
    if(back){
      TreaVoiceHepDwidiwn.instance.pauseBgmdwodpw();
      _timer=Timer(Duration(milliseconds: 3000), () {
        _back=true;
      });
    }else{
      TreaTttIwjodwm.instance.sessionEventdwodjo();
      TreaVoiceHepDwidiwn.instance.playBgmdwmodwo();
      _timer?.cancel();
      _timer=null;
      if(toOpenNotification){
        await Future.delayed(Duration(milliseconds: 1000));
        TreaNotificationHepDwjijdow.instance.initNotificationdwoidjw();
        toOpenNotification=false;
      }else{
        TreaNotificationHepDwjijdow.instance.checkNotificationNum();
      }
      await Future.delayed(Duration(milliseconds: 200));
      if(_back&&!FlutterAndroidAdPlugins.instance.adShowing()){
        TreaAdHepNwidiow.instance.showAdndiwjdow(
          adType: AdType.interstitial,
          adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_launch,
          showAd: true,
          isOpenAd: true,
          closeAd: (give){},
        );
      }
      _back=false;
    }
  }
}