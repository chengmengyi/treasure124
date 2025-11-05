import 'dart:convert';

import 'package:flutter_android_ad_plugins/data/ad_info_data.dart';
import 'package:flutter_android_ad_plugins/data/config_ad_data.dart';
import 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
import 'package:flutter_android_ad_plugins/hep/ad_num_hep.dart';
import 'package:flutter_android_ad_plugins/hep/ad_type.dart';
import 'package:flutter_android_ad_plugins/hep/ios_ad_callback.dart';
import 'package:flutter_android_ad_plugins/hep/ios_load_ad_result_callback.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_fk_hep_dwidowmd.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/dialog/trea_ad_limit_dialog_dwijow/trea_ad_limit_dialog_dwijow.dart';
import 'package:treadwkd_bbbase/ui/dialog/trea_no_ad_dialog_dwijow/trea_no_ad_dialog_dwijow.dart';

class TreaAdHepNwidiow{
  static final TreaAdHepNwidiow _adHepNwidiow=TreaAdHepNwidiow();
  static TreaAdHepNwidiow get instance=>_adHepNwidiow;

  initAdwieji(){
    FlutterAndroidAdPlugins.instance.initMax(
      maxKey: TreaLocalDjwidj.maxKeyBase64.base64(),
      topOnAppId: "",
      topOnAppKey: "",
      data: _getConfigAdData(),
      fengKongLogic: (){
        return TreaFkHepDwidowmd.instance.checkHasFk();
      },
      iosLoadAdResultCallback: IosLoadAdResultCallback(
        startLoadAdCallback: (info){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ad_request,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat});
        },
        loadAdSuccessCallback: (maxAd,info,loadTime){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_return,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat,"ad_request_time":loadTime});
        },
        loadAdFailCallback: (info){},
        initSdkSuccess: (time,platform){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_initsuc,params: {"ad_platform":platform,"oxrsl_ad_init_time":time});
        },
      ),
    );
  }

  showAdndiwjdow({
    required AdType adType,
    required TreaAdPosIdEnumDwidjwm adPosId,
    required bool showAd,
    required Function(bool giveReward) closeAd,
    bool isOpenAd=false,
  }){
    if(!showAd){
      closeAd.call(false);
      return;
    }
    if(AdNumHep.instance.notLoad()){
      if(isOpenAd||adType==AdType.interstitial){
        closeAd.call(false);
        return;
      }
      TreaRouDwjidw.showDdjwidjow(
        child: TreaAdLimitDialogDwijow(
          dismissCallback: (){

          },
        ),
      );
      return;
    }
    if(TreaFkHepDwidowmd.instance.checkHasFk()){
      if(isOpenAd||adType==AdType.interstitial){
        closeAd.call(false);
        return;
      }
      showToast("The advertisement cannot be loaded");
      closeAd.call(false);
      return;
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_chance,params: {"ad_pos_id":adPosId.name});
    var resultData = FlutterAndroidAdPlugins.instance.getCacheResultData(adType);
    if(null==resultData){
      FlutterAndroidAdPlugins.instance.loadAdWhenNoCache(adType);
      // PsnBTbaUtils.instance.pointEvent(pointEnum: PsnTbaPointEnum.apwxi_ad_impression_fail,params: {"ad_pos_id":evnetEnum.name,"reason":"ad_nocache"});
      if(isOpenAd||adType==AdType.interstitial){
        closeAd.call(false);
        return;
      }
      TreaRouDwjidw.showDdjwidjow(
        child: TreaNoAdDialogDwijow(
          tryAgainCallback: (){
            var data = FlutterAndroidAdPlugins.instance.getCacheResultData(adType);
            if(null==data){
              if(adType==AdType.interstitial){
                closeAd.call(false);
              }else{
                closeAd.call(true);
              }
              return;
            }
            _startShowAdwdiwhdiw(adType: adType, adPosId: adPosId, closeAd: closeAd,isOpenAd: isOpenAd);
          },
          closeCallback: (){
            closeAd.call(false);
          },
        ),
      );
      return;
    }
    _startShowAdwdiwhdiw(adType: adType, adPosId: adPosId, closeAd: closeAd,isOpenAd: isOpenAd);
  }

  _startShowAdwdiwhdiw({
    required AdType adType,
    required TreaAdPosIdEnumDwidjwm adPosId,
    required Function(bool giveReward) closeAd,
    bool isOpenAd=false,
}){
    FlutterAndroidAdPlugins.instance.showAd(
      adType: adType,
      iosAdCallback: IosAdCallback(
        showSuccess: (ad,info){
          // _checkRewardShowTime(adType);
          // PsnFbUtils.instance.logPurchase(ad?.revenue??0.0,);
          // FlutterCheckAf.instance.uploadAdRevenue(ad?.networkName??"", ad?.revenue??0, ad?.adUnitId??"", evnetEnum.name);
          // PsnBTbaUtils.instance.adEvent(ad: ad, adEventEnum: evnetEnum, adInfoData: info);
          // PsnMusicUtils.instance.pauseBackMp3();
          // psnAdWatchNum.saveData(psnAdWatchNum.getData()+1);
          // var adLevel = psnLastAdLevel.getData()+5;
          // if(psnAdWatchNum.getData()>=adLevel){
          //   PsnBTbaUtils.instance.pointEvent(pointEnum: PsnTbaPointEnum.cash_ad_detail,params: {"ad":adLevel});
          //   psnLastAdLevel.saveData(adLevel);
          // }

          TreaTttIwjodwm.instance.adEventjdiwjio(ad: ad, posId: adPosId, adInfoData: info);
        },
        showFail: (){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_impression_fail,params: {"ad_pos_id":adPosId.name,"reason":"impfail"});
          if(isOpenAd){
            closeAd.call(false);
            return;
          }
          if(adType==AdType.reward){
            showToast("Advertisement display failed, please try again later");
          }else{
            closeAd.call(false);
          }
        },
        closeAd: (ad,info,hasReward){
          // PsnBTbaUtils.instance.pointEvent(
          //   pointEnum: PsnTbaPointEnum.zuytu_ad_imp_close,
          //   params: {
          //     "ad_pos_id":evnetEnum.name,
          //     "ad_code_id":info?.adId,
          //     "ad_format":info?.adType.name,
          //     "msg":hasReward?"impsus":"impfail",
          //   },
          // );
          // _checkRewardCloseTime(adType);
          // lookAdCallback?.call();
          // PsnMusicUtils.instance.playBackMp3();

          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_imp_close,params: {"ad_pos_id":adPosId.name,"ad_code_id":info?.adId,"ad_format":info?.adType.name});


          closeAd.call(true);
        },
        revenuePaid: (ad,info){
          // _checkRevenuePaid(adType);
        },
      ),
    );
  }

  ConfigAdData _getConfigAdData(){
    var data = bAdConfigStr.getData();
    if(data.isEmpty){
      data=TreaLocalDjwidj.adStrBase64.base64();
    }
    var json = jsonDecode(data);
    return ConfigAdData(
      maxShowNum: json["cuinmvjc"],
      maxClickNum: json["raleziwu"],
      priceSwitch: json["ytmcp_switch"]??false,
      newInterList: _getNewAdList(json["ytmcp_int"]),
      newRewardList: _getNewAdList(json["ytmcp_rv"]),
    );
  }

  List<AdInfoData> _getNewAdList(List? list){
    if(null==list){
      return [];
    }
    List<AdInfoData> resultList=[];
    for (var value in list) {
      resultList.add(
          AdInfoData(
            adId: value["xkbjfvkg"],
            adPlat: value["lsgjcnmb"],
            adType: value["aenrwxeg"]=="reward"?AdType.reward:AdType.interstitial,
            expireTime: value["bcaaqhsm"],
          )
      );
    }
    return resultList;
  }

  updateAdInfo(){

  }

}