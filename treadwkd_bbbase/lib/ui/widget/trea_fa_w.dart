import 'dart:async';
import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';

abstract class TreaFaW extends StatefulWidget{

}

abstract class TreaFaWState<K extends TreaFaW> extends State<K>{
  late StreamSubscription<TreaEventBeanDjwid>? _ss;

  @override
  void initState() {
    super.initState();
    if(initEventjdiwjdiow()){
      _ss=TreaEventHepDhwidw.instance.getEvent().on<TreaEventBeanDjwid>().listen((bean) {
        handleEventwhudwhi(bean);
      });
    }
  }

  bool initEventjdiwjdiow()=>false;

  handleEventwhudwhi(TreaEventBeanDjwid bean){}

  @override
  Widget build(BuildContext context){
    return wwwdwjidwo();
  }

  Widget wwwdwjidwo();

  @override
  void dispose() {
    if(initEventjdiwjdiow()){
      _ss?.cancel();
      _ss=null;
    }
    super.dispose();
  }
}