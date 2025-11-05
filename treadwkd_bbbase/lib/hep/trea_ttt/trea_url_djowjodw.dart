import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';

class TreaUrlDjowjodw{
  Future<String> getUrl()async{
    var deviceModel = await FlutterTbaInfo.instance.getDeviceModel();
    var osCountry = await FlutterTbaInfo.instance.getOsCountry();
    var bundleId = await FlutterTbaInfo.instance.getBundleId();
    return "${TreaLocalDjwidj.tbaUrl}?franz=$deviceModel&stutter=$osCountry&refrain=$bundleId";
  }
}