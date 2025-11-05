import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_android_ad_plugins/hep/ad_num_hep.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_facebook_hep_djwijowm.dart';

StorageData<String> bAdConfigStr=StorageData<String>(key: "bAdConfigStr", defaultValue: "");
StorageData<bool> bInstallEvent=StorageData<bool>(key: "bInstallEvent", defaultValue: false);


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
  }
}