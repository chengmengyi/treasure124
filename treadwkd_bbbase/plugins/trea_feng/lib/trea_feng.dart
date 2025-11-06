import 'package:flutter/services.dart';

final class TreaFeng {
  static final TreaFeng instance = TreaFeng._internal();

  TreaFeng._internal();

  final _methodChannel = const MethodChannel('trea_feng');

  //设备是否被Root
  Future<bool> roTreafeiimwoot() async {
    return (await _methodChannel.invokeMethod("roTreafeiimwoot")) == true;
  }

  //是否连接VPN网络
  Future<bool> vpTreafeiimwon() async {
    return (await _methodChannel.invokeMethod("vpTreafeiimwon")) == true;
  }

  //设备是否有可用的sim卡
  Future<bool> siTreafeiimwom() async {
    return (await _methodChannel.invokeMethod("siTreafeiimwom")) == true;
  }

  //设备是否为模拟器
  Future<bool> siTreafeiimwomulator() async {
    return (await _methodChannel.invokeMethod("siTreafeiimwomulator")) == true;
  }

  //应用是否安装自Google play store
  Future<bool> stTreafeiimwoore() async {
    return (await _methodChannel.invokeMethod("stTreafeiimwoore")) == true;
  }

  //设备是否启用开发者模式
  Future<bool> deTreafeiimwoveloper() async {
    return (await _methodChannel.invokeMethod("deTreafeiimwoveloper")) == true;
  }

  //安装应用的安装器程序的包名
  Future<String> inTreafeiimwostaller() async {
    return await _methodChannel.invokeMethod("inTreafeiimwostaller");
  }

  //初始化数盟平台
  Future<void> inTreafeiimwoitNumberUnit({required String apiKey}) async {
    await _methodChannel.invokeMethod("inTreafeiimwoitNumberUnit", apiKey);
  }

  //从数盟平台读取数盟可信ID，对应文档请求参数：did
  Future<String> getTreafeiimwoNumberUnitID({String channel = "", String message = ""}) async {
    return (await _methodChannel.invokeMethod("geTreafeiimwotNumberUnitID", {
          "channel": channel,
          "message": message,
        })) ??
        "";
  }
}
