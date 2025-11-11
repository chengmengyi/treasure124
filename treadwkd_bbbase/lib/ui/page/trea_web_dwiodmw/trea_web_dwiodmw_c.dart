import 'dart:io';

import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/treadwkd_bbbase.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:url_launcher/url_launcher.dart';

class TreaWebDwiodmwC extends TreaFaC{
  var title="";
  late WebViewController controller;
  @override
  void onInit() {
    super.onInit();
    var map = TreaRouDwjidw.getPwjidjwodw();
    title=map["title"];
    var url=map["url"];
    if(map["isMoreGame"]){
      _loadMoreGame(url);
    }else{
      controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(url));
    }
  }

  _loadMoreGame(url)async{
    var gaid = await FlutterTbaInfo.instance.getGaid();
    controller=WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..runJavaScript("scratchwintreasure")
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {

          },
          onWebResourceError: (WebResourceError error) {

          },
          onNavigationRequest: (NavigationRequest request) {
            String url = request.url;
            bool result = _isDJijeo(url);
            if(result){
              _jjdowjodwm(url);
            }
            return result ? NavigationDecision.prevent : NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url+gaid));
  }

  bool _isDJijeo(String url) {
    if (url.startsWith("market:") || url.startsWith("http://play.google.com/store/") || url.contains("lz_open_browser=1") || url.startsWith("https://play.google.com/store/") || (url.startsWith("intent://") && Platform.isAndroid) || url.endsWith(".apk")) {
      return true;
    }
    return false;
  }

  _jjdowjodwm(String url) {
    try {
      if (url.startsWith("intent://")) {
        TreadwkdBbbase.instance.intentTo(url);
      }else{
        String url2 = url;
        if (url2.startsWith("market://details?id=")) {
          url2 = url2.replaceAll("market://details", "https://play.google.com/store/apps/details",);
        }
        launchUrl(Uri.parse(url2), mode: LaunchMode.externalApplication);
      }
    }catch (e) {

    }
  }
}