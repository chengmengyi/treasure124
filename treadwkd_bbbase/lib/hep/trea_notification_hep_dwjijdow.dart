import 'dart:io';

import 'package:birdsong/birdsong.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_point_enum_djwidjo.dart';
import 'package:treadwkd_bbbase/hep/trea_ttt/trea_ttt_iwjodwm.dart';

class TreaNotificationHepDwjijdow{
  static final TreaNotificationHepDwjijdow _dwjijdow=TreaNotificationHepDwjijdow();
  static TreaNotificationHepDwjijdow get instance => _dwjijdow;

  final List<BirdsongText> _normalList=[
    BirdsongText(title: "Lucky Scratch, Cash Win!", body: "Scratch once, cash in—luck’s here!"),
    BirdsongText(title: "Instant Cash Scratch!", body: "Swipe, scratch, win cash instantly!!"),
    BirdsongText(title: "Scratch & Score Cash!", body: "Every scratch hides cash—dig in!"),
    BirdsongText(title: "Cash in a Scratch!", body: "One tap, one scratch, real cash!"),
    BirdsongText(title: "Scratch for Big Cash!", body: "Scratch more, win bigger—go on!"),
    BirdsongText(title: "Hidden Cash Scratch!", body: "Uncover cash with every scratch!"),
    BirdsongText(title: "Quick Scratch, Quick Cash!", body: "Fast scratches, fast cash rewards!"),
    BirdsongText(title: "Scratch Your Cash Luck!", body: "Scratch now, cash your luck today!"),
    BirdsongText(title: "Cash Boost Scratch!", body: "Scratch, earn, boost your cash pile!"),
    BirdsongText(title: "Scratch to Win Cash!", body: "Luck’s a scratch away—start now!"),
  ];

  final List<BirdsongText> _lockList=[
    BirdsongText(title: "Daily Check-in + Cash Scratch!", body: "📅 Sign in, scratch—cash rewards await!"),
    BirdsongText(title: "Streak Check-in, Big Cash!", body: "✨ Keep signing in, scratch for bigger cash!"),
    BirdsongText(title: "Sign In & Scratch Cash!", body: "📝 Log in now—free scratch for real cash!"),
    BirdsongText(title: "Check-in to Unlock Cash Scratch!", body: "💰 Sign in, unlock—scratch & win today!"),
  ];

  initNotificationdwoidjw()async{
    if(Platform.isIOS){
      return;
    }
    var status = await Permission.notification.request();
    if(!status.isGranted){
      TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.noti_req_refuse);
      return;
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.push_status);

    await Birdsong.instance.initialize(
      image: BirdsongImage(big: "big", small: "small"),
      button: "Claim",
    );
    Birdsong.instance.repeat(content: _normalList, duration: kDebugMode?Duration(minutes: 1):Duration(minutes: 60));
    Birdsong.instance.present(content: _lockList, duration: kDebugMode?Duration(minutes: 1):Duration(minutes: 30));
    Birdsong.instance.subscribe(topic: "c124_scratch_01");
    Birdsong.instance.subscribe(topic: "c124_scratch_02");
    Birdsong.instance.onTrigger.listen((e){
      _uploadShowdwodow(e.source);
    });
    Birdsong.instance.onTap.listen((e){
      _uploadClickdwodow(e.source);
    });
  }

  _uploadShowdwodow(String source)async{
    var type=source;
    switch(source){
      case "firebase":
        type="fcm";
        break;
      case "repeat":
        type="local";
        break;
      case "present":
        type="unlock";
        break;
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.inform_show,params: {"inform_type":type});
  }
  _uploadClickdwodow(String source)async{
    var type=source;
    switch(source){
      case "firebase":
        type="fcm";
        break;
      case "repeat":
        type="local";
        break;
      case "present":
        type="unlock";
        break;
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.inform_c,params: {"inform_type":type});
  }
}