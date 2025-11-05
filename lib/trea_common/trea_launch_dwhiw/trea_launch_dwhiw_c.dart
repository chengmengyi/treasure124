import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ad_hep_nwidiow.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ad_pos_id_enum_dwidjwm.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';

StorageData<bool> firstOpenLaunchPage=StorageData<bool>(key: "firstOpenLaunchPage", defaultValue: true);

class TreaLaunchDwhiwC extends TreaFaC with GetSingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.launch_page);
    _initAnimator();
  }

  @override
  void onReady() {
    super.onReady();
    controller.forward();
  }

  _initAnimator()async{
    controller=AnimationController(duration: const Duration(seconds: 13),vsync: this)
      ..addListener(() {
        update(["pro","pro_text"]);
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          _animatorEnd();
        }
      });
  }

  _animatorEnd(){
    if(firstOpenLaunchPage.getData()){
      firstOpenLaunchPage.saveData(false);
      _toHome();
      return;
    }
    TreaAdHepNwidiow.instance.showAdndiwjdow(
      adType: AdType.interstitial,
      showAd: true,
      adPosId: TreaAdPosIdEnumDwidjwm.ytmcp_launch,
      isOpenAd: true,
      closeAd: (give){
        _toHome();
      },
    );
  }

  _toHome(){
    TreaRouDwjidw.offAllfwdjowjdow(routerName: TreaBbbbRoulistJfoejfo.home);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}