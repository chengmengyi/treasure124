import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
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

  AndroidFlutterLocalNotificationsPlugin plugin=AndroidFlutterLocalNotificationsPlugin();

  initNotificationdwoidjw()async{
    if(Platform.isIOS){
      return;
    }
    checkNotificationNum();
    var status = await Permission.notification.request();
    if(!status.isGranted){
      TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.noti_req_refuse);
      return;
    }
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.push_status);

    // await Birdsong.instance.initialize(
    //   image: BirdsongImage(big: "big", small: "small"),
    //   button: "Claim",
    // );
    // Birdsong.instance.repeat(content: _normalList, duration: Duration(minutes: 27));
    // Birdsong.instance.present(content: _lockList, duration: Duration(seconds: 5));
    // Birdsong.instance.subscribe(topic: "c124_scratch_01");
    // Birdsong.instance.subscribe(topic: "c124_scratch_02");
    // Birdsong.instance.onTrigger.listen((e){
    //   _uploadShowdwodow(e.source);
    // });
    // Birdsong.instance.onTap.listen((e){
    //   _uploadClickdwodow(e.source);
    // });

    var success = await plugin.initialize(
      AndroidInitializationSettings("logo"),
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _clickNotification(response.payload);
      },
    );
    if(success==true){
      for(var index=0;index<_normalList.length;index++){
        var info = _normalList[index];
        _show(index+1, info.title, info.body, kDebugMode?Duration(minutes: 1):Duration(minutes: 27));
      }
      _showLockScreenNotification();
      _initFcm("c124_scratch_01");
      _initFcm("c124_scratch_02");
    }
  }

  _show(id,title,body,Duration duration)async{
    AndroidNotificationDetails details = AndroidNotificationDetails(
      'scratch_channel',
      'scratch_channel_name',
      styleInformation: BeautyStyleInformation(
        title,
        body,
        'big',
        'Go Earn',
        'logo',
      ),
      priority: Priority.high,
      importance: Importance.high,
      groupKey: "$id",
    );
    await plugin.periodicallyShowWithDuration(
        id,
        title,
        body,
        duration,
        notificationDetails: details,
        scheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: "local"
    );
  }

  _showLockScreenNotification()async{
    BirdsongText info=_lockList.random();
    await plugin.showBroadcastNotification(
      70,
      info.title,
      info.body,
      kDebugMode?Duration(seconds: 5):Duration(minutes: 10),
      'android.intent.action.USER_PRESENT',
      AndroidNotificationDetails(
        'scratch_channel_lock',
        'scratch_channel_name_lock',
        priority: Priority.high,
        importance: Importance.high,
        styleInformation: BeautyStyleInformation(
          info.title,
          info.body,
          'big',
          'Go Earn',
          'logo',
        ),
        groupKey: "70",
      ),
      'unlock',
    );
  }

  _initFcm(String fcmStr)async{
    var result = await plugin.subscribeToTopic(
      fcmStr,
      const AndroidNotificationDetails(
        'scratch_channel_fcm',
        'scratch_channel_name_fcm',
        styleInformation: BeautyStyleInformation(
          '',
          '',
          '',
          'Go Earn',
          'logo',
        ),
        priority: Priority.high,
        importance: Importance.high,
      ),
    );
  }

  _clickNotification(String? from){
    TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.inform_c,params: {"inform_type":from});
  }

  checkNotificationNum()async{
    var localNum = await plugin.extractMessageReceivedNum("local");
    if(localNum>0){
      for(var index=0;index<localNum;index++){
        TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.inform_show,params: {"inform_type":"local"});
      }
    }
    var unlockNum = await plugin.extractMessageReceivedNum("unlock");
    if(unlockNum>0){
      for(var index=0;index<unlockNum;index++){
        TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.inform_show,params: {"inform_type":"unlock"});
      }
    }
    var fcmNum = await plugin.extractMessageReceivedNum("fcm");
    if(fcmNum>0){
      for(var index=0;index<fcmNum;index++){
        TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.inform_show,params: {"inform_type":"fcm"});
      }
    }
  }


  checkClickByLaunchApp()async{
    var launchDetails = await plugin.getNotificationAppLaunchDetails();
    if(launchDetails?.didNotificationLaunchApp==true){
      var id = launchDetails?.notificationResponse?.payload;
      _clickNotification(id);
    }
  }
}
class BirdsongText {
  final String title;
  final String body;

  BirdsongText({required this.title, required this.body});

  Map<String, dynamic> toMap() => {"title": title, "body": body};
}
