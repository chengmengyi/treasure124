import 'dart:io';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class TreaTopJsonDiwjdow{
  Future<Map<String,dynamic>> getTopJson()async{
    Map<String,dynamic> map={};
    map["potsherd"]={
      "onward":await FlutterTbaInfo.instance.getGaid(),
      "refrain":await FlutterTbaInfo.instance.getBundleId(),
      "oer":await FlutterTbaInfo.instance.getManufacturer(),
      "angles":await FlutterTbaInfo.instance.getAppVersion(),
      "laissez":await FlutterTbaInfo.instance.getOperator(),
      "bribe":await FlutterTbaInfo.instance.getLogId(),
      "semester":await FlutterTbaInfo.instance.getIdfv(),
      "gibe":await FlutterTbaInfo.instance.getSystemLanguage(),
      "typhoid":DateTime.now().millisecondsSinceEpoch,
    };
    map["chairman"]={
      "towhead":await FlutterTbaInfo.instance.getAndroidId(),
      "stutter":await FlutterTbaInfo.instance.getOsCountry(),
      "surveyor":await FlutterTbaInfo.instance.getNetworkType(),
      "bloat":await FlutterTbaInfo.instance.getBrand(),
      "seriatim":Platform.isAndroid?"gallus":"corp",
      "monica":await FlutterTbaInfo.instance.getIdfa(),
      "franz":await FlutterTbaInfo.instance.getDeviceModel(),
      "scrounge":await FlutterTbaInfo.instance.getOsVersion(),
      "repeater":await FlutterTbaInfo.instance.getDistinctId(),
    };
    return map;
  }
}