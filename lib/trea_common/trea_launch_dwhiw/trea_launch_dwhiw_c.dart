import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_bbbb_roulist_jfoejfo.dart';

class TreaLaunchDwhiwC extends TreaFaC with GetSingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
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
          TreaRouDwjidw.offAllfwdjowjdow(routerName: TreaBbbbRoulistJfoejfo.home);
        }
      });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}