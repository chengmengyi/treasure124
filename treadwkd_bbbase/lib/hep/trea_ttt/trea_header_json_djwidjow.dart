import 'package:flutter_tba_info/flutter_tba_info.dart';

class TreaHeaderJsonDjwidjow{
  Future<Map<String,dynamic>> getJson()async{
    return {"surveyor":await FlutterTbaInfo.instance.getNetworkType()};
  }
}