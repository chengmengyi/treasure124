import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';

abstract class TreaFaC extends GetxController{
  late BuildContext context;
  late StreamSubscription<TreaEventBeanDjwid>? _ss;

  @override
  void onInit() {
    super.onInit();
    if(initEventjdiwjdiow()){
      _ss=TreaEventHepDhwidw.instance.getEvent().on<TreaEventBeanDjwid>().listen((bean) {
        handleEventwhudwhi(bean);
      });
    }
  }

  bool initEventjdiwjdiow()=>false;

  handleEventwhudwhi(TreaEventBeanDjwid bean){}

  @override
  void onClose() {
    if(initEventjdiwjdiow()){
      _ss?.cancel();
      _ss=null;
    }
    super.onClose();
  }
}