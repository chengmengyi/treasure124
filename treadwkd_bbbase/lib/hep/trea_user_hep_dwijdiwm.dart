import 'dart:io';
import 'package:flutter_check_adjust/flutter_check_adjust.dart';
import 'package:flutter_check_adjust/request_adjust/request_adjust_callback.dart';
import 'package:flutter_check_adjust/request_cloak/request_cloak_callback.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';

class TreaUserHepDwijdiwm {
  static final TreaUserHepDwijdiwm _dwijdiwm=TreaUserHepDwijdiwm();
  static TreaUserHepDwijdiwm get instance => _dwijdiwm;

  initCheckejije()async{
    var distinctId = await FlutterTbaInfo.instance.getDistinctId();
    FlutterCheckAdjust.instance.init(
      adjustAppToken: TreaLocalDjwidj.adjustAppTokenBase64.base64(),
      distinctId: distinctId,
      clockUrl: TreaLocalDjwidj.cloakUrl,
      cloakWhiteKey: "scribe",
      cloakData: await _getCloakMap(distinctId),
      referrerConfList: ["fb4a","gclid","not%20set","youtubeads","%7B%22","bytedance","adjust"],
      requestAdjustCallback: RequestAdjustCallback(
        startRequestAdjust: (){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.af_req);
        },
        requestSuccess: (bool isB){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.af_suc,params: {"cloak_user":isB?1:0});
        },
        firstRequestAdjustB: (){
        },
      ),
      requestCloakCallback: RequestCloakCallback(
        startRequestCloak: (){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cloak_req);
        },
        requestSuccess: (bool isWhite){
          TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.cloak_suc,params: {"cloak_user":isWhite?1:0});
        },
      ),
    );
  }

  Future<Map<String,dynamic>> _getCloakMap(String distinctId)async{
    var refrain = await FlutterTbaInfo.instance.getBundleId();
    var seriatim = Platform.isAndroid?"gallus":"corp";
    var angles = await FlutterTbaInfo.instance.getAppVersion();
    var typhoid = DateTime.now().millisecondsSinceEpoch;
    var franz = await FlutterTbaInfo.instance.getDeviceModel();
    var scrounge = await FlutterTbaInfo.instance.getOsVersion();
    var semester = await FlutterTbaInfo.instance.getIdfv();
    var onward = await FlutterTbaInfo.instance.getGaid();
    var towhead = await FlutterTbaInfo.instance.getAndroidId();
    var monica = await FlutterTbaInfo.instance.getIdfa();
    var laissez = await FlutterTbaInfo.instance.getOperator();
    var bloat = await FlutterTbaInfo.instance.getBrand();
    return {
      "refrain":refrain,
      "seriatim":seriatim,
      "angles":angles,
      "repeater":distinctId,
      "typhoid":typhoid,
      "franz":franz,
      "scrounge":scrounge,
      "semester":semester,
      "onward":onward,
      "towhead":towhead,
      "monica":monica,
      "laissez":laissez,
      "bloat":bloat,
    };
  }
}