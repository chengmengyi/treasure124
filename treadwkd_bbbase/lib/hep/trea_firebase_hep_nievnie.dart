import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

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
  }
}