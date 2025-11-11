import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_android_ad_plugins/hep/ad_num_hep.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_facebook_hep_djwijowm.dart';
import 'package:treadwkd_bbbase/hep/trea_fk_dwidjow/trea_fk_hep_dwidowmd.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';

StorageData<String> bAdConfigStr=StorageData<String>(key: "bAdConfigStr", defaultValue: "");
StorageData<bool> bInstallEvent=StorageData<bool>(key: "bInstallEvent", defaultValue: false);
StorageData<bool> bPlayMusic=StorageData<bool>(key: "bPlayMusic", defaultValue: true);
StorageData<bool> bPlaySound=StorageData<bool>(key: "bPlaySound", defaultValue: true);
StorageData<String> bFkConfig=StorageData<String>(key: "bFkConfig", defaultValue: "");
StorageData<String> bHasFkLocalTag=StorageData<String>(key: "bHasFkLocalTag", defaultValue: "");

StorageData<int> treaLocalAdLevelLastdwidow=StorageData<int>(key: "treaLocalAdLevelLastdwidow", defaultValue: 0);
StorageData<int> treaLookAdNumwhdiwidwn=StorageData<int>(key: "treaLookAdNumwhdiwidwn", defaultValue: 0);

//上次显示激励广告时间
StorageData<int> treaShowRewardAdTimeLastdwidjiow=StorageData<int>(key: "treaShowRewardAdTimeLastdwidjiow", defaultValue: 0);
//两次激励广告的时间很小的次数统计
StorageData<int> treaTwoRewardAdTimeSoSmalldwodow=StorageData<int>(key: "treaTwoRewardAdTimeSoSmalldwodow", defaultValue: 0);

//开始显示激励广告的时间
StorageData<int> treaStartShowRewardAdTimedmwodmow=StorageData<int>(key: "treaStartShowRewardAdTimedmwodmow", defaultValue: 0);
//播放到关闭激励广告的时间小的次数统计
StorageData<int> treaWatchAdTimeSoSmalldjwijdi=StorageData<int>(key: "treaWatchAdTimeSoSmalldjwijdi", defaultValue: 0);

//获取激励广告奖励次数
StorageData<int> treaGetRewardRevenueNumdwjdjwo=StorageData<int>(key: "treaGetRewardRevenueNumdwjdjwo", defaultValue: 0);

//达到提现门槛，视频次数小于3次，被风控
StorageData<bool> treaCashMoneyAdLessdwidow=StorageData<bool>(key: "treaCashMoneyAdLessdwidow", defaultValue: false);
//视频次数大于90次，没有达到提现门槛，被风控
StorageData<bool> treaCashMoneyAdMoredwidjow=StorageData<bool>(key: "treaCashMoneyAdMoredwidjow", defaultValue: false);

class TreaFirebaseHepNievnie{
  static final TreaFirebaseHepNievnie _firebaseHepNievnie=TreaFirebaseHepNievnie();
  static TreaFirebaseHepNievnie get instance => _firebaseHepNievnie;

  Function(String s)? valueCallback;

  init()async{
    try{
      await Firebase.initializeApp();
      var remoteConfig=FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();
      _getConfig(remoteConfig);
    }catch(e){
      await Future.delayed(const Duration(milliseconds: 1000));
      TreaFacebookHepDjwijowm.instance.initFacebook(TreaLocalDjwidj.facebookLocalConfig.base64());
      init();
    }
  }

  _getConfig(FirebaseRemoteConfig remoteConfig){
    var br_numbers_us = remoteConfig.getString("br_numbers_us");
    if(br_numbers_us.isNotEmpty){
      valueCallback?.call(br_numbers_us);
    }
    var ytmcp_ad_config = remoteConfig.getString("ytmcp_ad_config");
    if(ytmcp_ad_config.isNotEmpty){
      bAdConfigStr.saveData(ytmcp_ad_config);
      TreaAdHepNwidiow.instance.updateAdInfo();
    }
    var scratchtreasure_fb_inform = remoteConfig.getString("scratchtreasure_fb_inform");
    if(scratchtreasure_fb_inform.isNotEmpty){
      TreaFacebookHepDjwijowm.instance.initFacebook(scratchtreasure_fb_inform);
    }
    var risk_control = remoteConfig.getString("risk_control");
    if(risk_control.isNotEmpty){
      bFkConfig.saveData(risk_control);
      TreaFkHepDwidowmd.instance.initFk();
    }
  }

  test()async{
    var remoteConfig=FirebaseRemoteConfig.instance;

    var scratchtreasure_fb_inform = remoteConfig.getString("scratchtreasure_fb_inform");
    print("kk===${scratchtreasure_fb_inform}");
    TreaFacebookHepDjwijowm.instance.uploadRevenueToFacebook(AdMoneyInfoBean(revenue: 0.00001,adUnitId: "",networkName: "",revenuePrecision: ""));
  }
}