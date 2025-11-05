import 'dart:convert';

import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';

class TreaFacebookHepDjwijowm{
  static final TreaFacebookHepDjwijowm _djwijowm=TreaFacebookHepDjwijowm();
  static TreaFacebookHepDjwijowm get instance => _djwijowm;

  var _hasInit=false;

  initFacebook(String s){
    if(_hasInit){
      return;
    }
    try{
      var json = jsonDecode(s);
      FlutterCustomFacebook.instance.initFaceBook(
        facebookId: json["app_id"].toString(),
        facebookToken: json["client_token"],
        facebookAppName: json["app_name"],
      );
      _hasInit=true;
    }catch(e){

    }
  }

  uploadRevenueToFacebook(AdMoneyInfoBean? ad){
    if(!_hasInit){
      return;
    }
    FlutterCustomFacebook.instance.logPurchase(amount: ad?.revenue??0, currency: "USD",);
  }
}