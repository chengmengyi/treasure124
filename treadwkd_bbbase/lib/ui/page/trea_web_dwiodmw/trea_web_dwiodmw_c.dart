import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

class TreaWebDwiodmwC extends TreaFaC{
  var title="";
  late WebViewController controller;
  @override
  void onInit() {
    super.onInit();
    var map = TreaRouDwjidw.getPwjidjwodw();
    title=map["title"];
    var url=map["url"];
    controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(url));
  }
}