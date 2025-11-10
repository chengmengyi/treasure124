import 'dart:convert';

import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';

class TreaFacebookHepDjwijowm{
  static final TreaFacebookHepDjwijowm _djwijowm=TreaFacebookHepDjwijowm();
  static TreaFacebookHepDjwijowm get instance => _djwijowm;

  initFacebook(String s){
    try{
      var json = jsonDecode(s);
      FlutterCustomFacebook.instance.initFaceBook(
        facebookId: json["app_id"].toString(),
        facebookToken: json["client_token"],
        facebookAppName: json["app_name"],
      );
    }catch(e){

    }
  }

  uploadRevenueToFacebook(AdMoneyInfoBean? ad){
    FlutterCustomFacebook.instance.logPurchase(amount: ad?.revenue??0, currency: "USD",);
  }
}